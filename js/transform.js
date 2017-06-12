---
---
$(function() {
    var inputFile = getUrlParameter('f');
    if(inputFile) {
        gatherInputXML(inputFile);
    }
});

// Attempt to load the user-provided XML e-file
function gatherInputXML(inputFile) {
    var templateFile = '{{ site.github.url}}/form_template.xml';
    Promise.all([
        loadXML(inputFile),
        loadXML(templateFile)
    ]).then(function(responses) {
        cacheForms(responses[0], responses[1]);
        addXMLToPage(responses[0], responses[1]);

        return responses;
    }).catch(function(error) {
        console.log(error);
    });
}

// Store the requested XML documents in SessionStorage. This
// allows us to reuse resources on page reloads (such as the user
// going back and forth between forms/schedules).
function cacheForms(inputDom, templateDom) {
    var ser = new XMLSerializer();
    sessionStorage.setItem(inputFileId(), ser.serializeToString(inputDom));
    sessionStorage.setItem('template', ser.serializeToString(templateDom));
}

// Confirm to the user their document has been loaded and present
// the user with forms they can select to view
function addXMLToPage(inputDom, templateDom) {
    var inputFilename = inputDom.documentURI ? inputFileId() : 'IRS e-File';
    $('#input-filename').text('Loaded: ' + inputFilename);

    var forms = getListOfForms(inputDom);
    forms.forEach(function(formName) {
        $('#forms-list').append(
            $('<li>').append(
                $('<a>').attr({href: '#'+formName, id: formName}).append(formName)
        ));
    });
    $('#forms-list a').click(displayForm);
}

// Given an XML file representing an IRS e-file, return an array
// containing the names of each contained form and schedule.
function getListOfForms(inputDom) {
    var returnData = inputDom.getElementsByTagName('ReturnData')[0];
    var children = returnData ? Array.prototype.slice.call(returnData.children) : [];
    return children.map(function(child) {
        return child.nodeName;
    });
}

// A Promise that requests and returns a parsed XML DOM
function loadXML(url) {
    return new Promise (function(resolve, reject) {
        var request = new XMLHttpRequest();
        request.open('GET', url);
        request.responseType = 'document';
        request.onload = function() {
            if(request.status === 200) {
                resolve(request.responseXML);
            } else {
                reject(Error('XML didn\'t load successfully; error code: ' + request.status + ' (' + request.statusText + ')'));
            }
        };
        request.onerror = function() {
            reject(Error('There was a network error.'));
        };
        request.send();
    });
}

//======================================
//
// PROCESS XML TRANSFORMATION
//
//======================================

// Click handler to start building the form that was
// clicked by the user
function displayForm(e) {
    e.preventDefault();
    generateAndDisplayForm($(this).attr('id'));
}

function generateAndDisplayForm(formId, dest) {
    if(!sessionStorage[inputFileId()] || !sessionStorage['template']) {
        // TODO Error UI
        throw Error('Could not load input XML file to process');
    }
    
    var parser = new DOMParser();
    var inputDom = parser.parseFromString(sessionStorage.getItem(inputFileId()), 'text/xml');
    var templateDom = parser.parseFromString(sessionStorage.getItem('template'), 'text/xml');

    moveHeaderAndMainForm(inputDom, templateDom, formId);
    setFormProperties(inputDom, templateDom, formId);

    // var formHtml = render(templateDom, formId);
}

// Move the main form data into the template
function moveHeaderAndMainForm(inputDom, templateDom, formId) {
    var formData = inputDom.getElementsByTagName(formId)[0];
    var formHeader = inputDom.getElementsByTagName('ReturnHeader')[0];

    var tHeader = templateDom.getElementsByTagName('ReturnHeader')[0];
    var tData = templateDom.getElementsByTagName('SubmissionDocument')[0];
    tHeader.parentNode.replaceChild(formHeader.cloneNode(true), tHeader);
    tData.appendChild(formData.cloneNode(true));
}

// Set individual values for the template parameters
function setFormProperties(inputDom, templateDom, formId) {
    // This namespace resolver is necessary for XPath in order to
    // handle the default namespace applied on IRS e-file documents.
    // It is also necessary to prefix all XPath elements with a
    // namespace prefix (though the prefix itself doesn't matter).
    // https://stackoverflow.com/a/9622169
    var nsResolver = (function (element) {
        var nsResolver = element.ownerDocument.createNSResolver(element);
        var defaultNamespace = element.getAttribute('xmlns');

        return function (prefix) {
            return nsResolver.lookupNamespaceURI(prefix) || defaultNamespace;
        };
    }(inputDom.documentElement));

    // Iterate through and set all properties
    var propsToTransfer = [
        { xpath: '//d:Return/@returnVersion', dest: 'ReturnVersion' },
        { xpath: '//d:Return/@returnVersion', dest: 'SubmissionVersion' },
        { xpath: '//d:ReturnHeader/d:ReturnTypeCd', dest: 'SubmissionType' },
        { xpath: '//d:ReturnHeader/d:Filer/d:EIN', dest: 'TINLatest' },
        { xpath: '//d:'+formId+'/@documentId', dest: 'DocumentId' }
    ];
    propsToTransfer.forEach(function(prop) {
        var val = getXPathValue(inputDom, prop.xpath, nsResolver);
        setNodeValue(templateDom, prop.dest, val);
    });

    // Set DLN properties if they are available
    if(getUrlParameter('f') && inputFileId().indexOf('_public') !== -1) {
        var dln = inputFileId().match(/\d+/)[0];
        setNodeValue(templateDom, 'DLN', dln);
        setNodeValue(templateDom, 'DLNLatest', dln);
    }
}

// Transform the XML using the appropriate stylesheet based
// on the form type
function render(templateDom, formId) {
    var stylesheet = getStylesheet(templateDom, formId);

    if(!window['XSLTProcessor']) {
        return parsedXML.transformNode(stylesheet);
    } else {
        var ser = new XMLSerializer();
        var proc = new XSLTProcessor();
        proc.importStylesheet(stylesheet);
        return ser.serializeToString(proc.transformToDocument(templateDom));
    }
}

// Utility function to help query XPath values from an input
// file. Assumes that a single value is trying to be accessed.
function getXPathValue(dom, xpath, nsResolver) {
    var xpathResult = dom.evaluate(xpath, dom, nsResolver, XPathResult.ANY_TYPE, null);
    if(xpath.indexOf('@') !== -1) {
        return xpathResult.iterateNext().value;
    } else {
        return xpathResult.iterateNext().textContent;
    }
}

// Utility function to set values for the template
function setNodeValue(dom, nodeName, value) {
    dom.getElementsByTagName(nodeName)[0].appendChild(document.createTextNode(value));
}

// Return a parsed XSLT stylesheet that is appropriate given
// the provided e-file form
function getStylesheet(templateDom, formId) {
    var year = templateDom.getElementsByTagName('ReturnVersion')[0].textContent.match(/\d+/)[0];
    var stylesheetPath = '{{ site.github.url}}//mef/Stylesheets/'+year+'/'+formId+'.xsl';

    // loadXML(stylesheetPath)
}

// Utility function for accessing URL query parameters by key
function getUrlParameter(name) {
    name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
    var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
    var results = regex.exec(location.search);
    return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
}

// Utility function for accessing the filename or identifier for
// the input XML document
function inputFileId() {
    var file = getUrlParameter('f');
    return file.substring(file.lastIndexOf('/')+1);
}
