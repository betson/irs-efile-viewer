---
---
$(function() {
    var urlFile = getUrlParameter('f');
    var userFile = getUrlParameter('h');
    if(urlFile) {
        gatherInputXML(urlFile);
    } else if(userFile) {
        if(sessionStorage.getItem(userFile+'_name')) {
            gatherInputXML();
        } else {
            displayError('The file you requested is no longer available. Please select or upload a new file.');
        }
    } else {
        displayError('No file was requested.');
    }
});

// Attempt to load the user-provided XML e-file
function gatherInputXML(inputFile) {
    var templateFile = '{{ site.github.url}}/form_template.xml';
    var templateStr = sessionStorage.getItem('template');
    var inputStr = sessionStorage.getItem(inputStorageId());
    
    var formsToLoad = [];
    var formKeys = [];
    if(!templateStr) {
        formsToLoad.push(loadXML(templateFile));
        formKeys.push('template');
    }
    if(!inputStr) {
        formsToLoad.push(loadXML(inputFile));
        formKeys.push(inputStorageId());
    }

    // If our files are already cached, skip accessing them again
    if(formsToLoad.length === 0) {
        addXMLToPage(new DOMParser().parseFromString(inputStr, 'text/xml'));
    } else {
        Promise.all(formsToLoad
        ).then(function(responses) {
            var inputDom;
            responses.forEach(function(response, i) {
                cacheForms(response, formKeys[i]);
                if(formKeys[i] !== 'template') {
                    inputDom = response;
                }
            });

            inputDom = inputDom || new DOMParser().parseFromString(inputStr, 'text/xml');
            addXMLToPage(inputDom);
        }).catch(function(error) {
            console.log(error);
            displayError('There was a problem accessing ' + inputFilename());
        });
    }
}

// Store the requested XML documents in SessionStorage. This
// allows us to reuse resources on page reloads (such as the user
// going back and forth between forms/schedules).
function cacheForms(xmlDom, key) {
    var ser = new XMLSerializer();
    sessionStorage.setItem(key, ser.serializeToString(xmlDom));
}

// Generic function to display to the user there was an error
function displayError(message) {
    $('#input-filename').text(message);
}

// Confirm to the user their document has been loaded and present
// the user with forms they can select to view
function addXMLToPage(inputDom) {
    $('#input-filename').text('Loaded: ' + inputFilename());

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
        if(!url) {
            reject(Error('No file was requested.'));
            return;
        }

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
    if(!sessionStorage[inputStorageId()] || !sessionStorage['template']) {
        // TODO Error UI
        throw Error('Could not load input XML file to process');
    }

    // Gather XML from browser storage
    var parser = new DOMParser();
    var inputStr = removeNamespaces(sessionStorage.getItem(inputStorageId()));
    var inputDom = parser.parseFromString(inputStr, 'text/xml');
    var templateDom = parser.parseFromString(sessionStorage.getItem('template'), 'text/xml');

    // Configure template file
    moveHeaderAndMainForm(inputDom, templateDom, formId);
    setFormProperties(inputDom, templateDom, formId);
    var stylesheetPath = getStylesheetPath(templateDom, formId);

    // Display rendered form to the user
    // In order to display the form in a separate window, the action
    // must happen synchronously with a user action (click). Because
    // loading the stylesheet is an async action, we need to open
    // the window first ahead of time.
    var destWindow;
    if(!dest) {
        destWindow = window.open('about:blank');
    }
    loadXML(stylesheetPath).then(function(stylesheet) {
        var formHtml = render(templateDom, stylesheet);
        if(dest) {
            $('#'+dest).attr('src', 'data:text/html;charset=utf-8,' + encodeURIComponent(formHtml));
        } else {
            destWindow.document.write(formHtml);
        }
    }).catch(function(error) {
        console.log(error);
    });
}

// The input e-file from the IRS likely has a default namespace
// applied. This needs to be removed in order for the XPath within
// the stylesheets to work appropriately. However, after the XML
// has been parsed, JavaScript doesn't allow you to change/remove
// the namespace URI. Instead, we have to specifically remove it
// from the text serialization.
// https://stackoverflow.com/a/4527802
function removeNamespaces(XMLString) {
    return XMLString.replace(/<([a-zA-Z0-9 ]+)xmlns=\"[^\"]*\"(.*)>/g, '<$1$2>');
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
    // Iterate through and set all properties
    var propsToTransfer = [
        { xpath: '//Return/@returnVersion', dest: 'ReturnVersion' },
        { xpath: '//Return/@returnVersion', dest: 'SubmissionVersion' },
        { xpath: '//ReturnHeader/ReturnTypeCd', dest: 'SubmissionType' },
        { xpath: '//ReturnHeader/Filer/EIN', dest: 'TINLatest', transform: formatTIN },
        { xpath: '//ReturnHeader/Filer/EIN', dest: 'TIN', transform: formatTIN },
        { xpath: '//'+formId+'/@documentId', dest: 'DocumentId' }
    ];
    propsToTransfer.forEach(function(prop) {
        var val = getXPathValue(inputDom, prop.xpath);
        val = prop.transform ? prop.transform(val) : val;
        setNodeValue(templateDom, prop.dest, val);
    });

    // Set DLN properties if they are available
    if(inputFilename().indexOf('_public') !== -1) {
        var dln = inputFilename().match(/\d+/)[0];
        setNodeValue(templateDom, 'DLN', dln);
        setNodeValue(templateDom, 'DLNLatest', dln);
    }
}

// Transform the XML using the appropriate stylesheet based
// on the form type
function render(templateDom, stylesheet) {
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
function getXPathValue(dom, xpath) {
    var xpathResult = dom.evaluate(xpath, dom, null, XPathResult.ANY_TYPE, null);
    if(xpath.indexOf('@') !== -1) {
        return xpathResult.iterateNext().value;
    } else {
        return xpathResult.iterateNext().textContent;
    }
}

// Utility function to set values for the template
function setNodeValue(dom, nodeName, value) {
    var node = dom.getElementsByTagName(nodeName)[0];
    node.parentNode.replaceChild(node.cloneNode(false).appendChild(document.createTextNode(value)).parentNode, node);
}

// Utility function to format TIN in XX-XXXXXXX format
function formatTIN(tin) {
    return tin.slice(0,2) + '-' + tin.slice(2);
}

// Return the path to the XSLT stylesheet that is appropriate
// given the provided e-file form
function getStylesheetPath(templateDom, formId) {
    var year = templateDom.getElementsByTagName('ReturnVersion')[0].textContent.match(/\d+/)[0];
    return '{{ site.github.url}}//mef/Stylesheets/'+year+'/'+formId+'.xsl';
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
function inputStorageId() {
    var file = getUrlParameter('f');
    var hash = getUrlParameter('h');
    return hash || file.substring(file.lastIndexOf('/')+1);
}

// Utility function for accessing the name of the file being
// processed.
function inputFilename() {
    var hash = getUrlParameter('h');
    if(hash) {
        return sessionStorage.getItem(hash+'_name');
    } else {
        return inputStorageId();
    }
}
