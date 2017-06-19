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

//======================================
//
// PAGE SETUP
//
//======================================

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
            return Promise.resolve(inputDom).then(addXMLToPage);
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

    var formProps = getNameAndTaxYear(inputDom);
    if(formProps) {
        $('#filer-name').append(formProps.name + ' &mdash; ' + formProps.year);
    }

    var forms = getListOfForms(inputDom);
    forms.forEach(function(formName) {
        $('#forms-list').append(
            $('<li>').append(
                $('<a>').attr({href: '#'+formName, id: formName}).append(
                    $('<span>').append(getDisplayName(formName, true)),
                    $('<span>').append(getDisplayName(formName))
                )
            )
        );
    });
    $('#forms-list a').click(displayForm);
}

// Given an XML file representing an IRS e-file, return the name of
// the file and the tax year.
function getNameAndTaxYear(inputDom) {
    // Because this is happening during initial page load, inputDom
    // may be the original value of the input file -- which means
    // namespaces may not be removed. We cannot rely on XPath to get
    // our values.
    // We also shouldn't break page load if these values are not
    // found. The transformation can still occur.
    var filer = inputDom.getElementsByTagName('Filer')[0];
    var name = filer ? filer.getElementsByTagName('BusinessNameLine1Txt')[0] : null;
    name = name ? name : filer.getElementsByTagName('BusinessNameLine1')[0];
    var root = inputDom.getElementsByTagName('Return')[0]
    var year = root ? root.getAttribute('returnVersion') : null;
    return name && year ? { 'name': name.textContent, 'year': year.substring(0,4) } : null;
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

// Return a version of the formName that should be displayed to the
// user.
function getDisplayName(formName, short) {
    // This regular expression checks if we are looking at a 990 form
    // (990, 990EZ, 990PF). We specifically do not want to match
    // anything where '990' is surrounded by other digits, such as
    // 8990 or 9902. Additionally, we don't want to match a 990
    // Schedule.
    // Format is influenced by https://stackoverflow.com/a/7376612
    var isPrimary990Form = /^(?:(?!\d990).)*990(?!\d)(?!Schedule)/;

    if(short) {
        if(formName.match(isPrimary990Form)) {
            return '990';
        } else {
            if(formName.match(/Schedule[A-Z]$/)) {
                return formName.charAt(formName.length-1);
            } else {
                return $('<i>').attr({'class': 'fa fa-file-text-o', 'aria-hidden': true, 'title': 'Form without Schedule letter'});
            }
        }
    } else {
        // If it's a primary form, just put a space after 990. Else,
        // put a space between each PascalCase word.
        var name = formName.replace(/^IRS/, '');
        if(name.match(isPrimary990Form)) {
            return name.replace(/(990)/, '$1 ');
        }
        return name.replace(/([A-Z])/g, ' $1');
    }
}

// A Promise that requests and returns a parsed XML DOM
function loadXML(url) {
    return new Promise (function(resolve, reject) {
        if(!url) {
            reject(Error('No file was requested.'));
            return;
        }

        if(!window['XSLTProcessor'] && url.match(/\.xsl$/)) {
            // In IE11, the only way to run an XSL transformation is
            // via a non-standard MSXML object. However, we don't want
            // to use this generally because we wouldn't be able to do
            // standard document manipulations. Instead, we'll only
            // load this way for the XSL because we don't need to
            // manipulate it.
            // We can't serialize and re-load an XML DOM normally
            // loaded because of the relative <include> references
            // within the stylesheets. Those will only resolve
            // correctly if loaded via the source directory.
            var xslDoc = new ActiveXObject('Msxml2.FreeThreadedDOMDocument.6.0');
            xslDoc.resolveExternals = true;
            xslDoc.validateOnParse = false;
            xslDoc.setProperty('NewParser', true);
            xslDoc.setProperty('ProhibitDTD', false);
            xslDoc.setProperty('AllowDocumentFunction', true);
            xslDoc.load(url);
            if (xslDoc.parseError.errorCode != 0) {
                reject('XML didn\'t load successfully.');
            } else {
                resolve(xslDoc);
            }
        } else {
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
        }
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
    $(this).blur();
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
        destWindow.document.write('<link href="{{site.github.url}}/css/loading.css" rel="stylesheet"><div class="loader"><span>{</span><span>}</span></div>');
        destWindow.document.close();
    }
    loadXML(stylesheetPath).then(function(stylesheet) {
        var formHtml = render(templateDom, stylesheet);
        if(dest) {
            $('#'+dest).attr('src', 'data:text/html;charset=utf-8,' + encodeURIComponent(formHtml));
        } else {
            destWindow.document.write(formHtml);
            destWindow.document.close();
            destWindow.history.replaceState(null, null, location.href.replace(location.hash, '')+'#'+formId);
        }
    }).catch(function(error) {
        console.log(error);
        if(destWindow) {
            destWindow.close();
        }
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
    var propsToTransfer = [
        { xpath: '/Return/@returnVersion', dest: 'ReturnVersion' },
        { xpath: '/Return/@returnVersion', dest: 'SubmissionVersion' },
        { xpath: '//ReturnHeader/ReturnTs', dest: 'SystemMode', transform: formatDate },
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

    // Set ObjectID (unique identifier) properties if they are available
    if(inputFilename().indexOf('_public') !== -1) {
        var objId = inputFilename().match(/\d+/)[0];
        var subDate = getXPathValue(templateDom, '//SystemMode');
        setNodeValue(templateDom, 'FormHeaderOriginalData', 'ObjectId: ' + objId);
        setNodeValue(templateDom, 'SystemMode', 'Submission: ' + subDate);
    }
}

// Transform the XML using the appropriate stylesheet based
// on the form type
function render(dom, stylesheet) {
    if(!window['XSLTProcessor']) {
        var ser = new XMLSerializer();
        var xmlDoc = new ActiveXObject('Msxml2.DOMDocument.6.0');
        xmlDoc.validateOnParse = false;
        xmlDoc.setProperty('NewParser', true);
        xmlDoc.loadXML(ser.serializeToString(dom));

        return xmlDoc.transformNode(stylesheet);
    } else {
        var ser = new XMLSerializer();
        var proc = new XSLTProcessor();
        proc.importStylesheet(stylesheet);
        return ser.serializeToString(proc.transformToDocument(dom));
    }
}

// Utility function to help query XPath values from an input
// file. Assumes that a single value is trying to be accessed.
function getXPathValue(dom, xpath) {
    // Attributes are broken on Wicked Good XPath. However, if we
    // receive the node, we can pull the attribute off using standard
    // DOM functions.
    // https://github.com/google/wicked-good-xpath/issues/40
    var matchResults = xpath.match(/\/@(.+$)/);
    var attr;
    if(matchResults) {
        attr = matchResults[1];
        xpath = xpath.replace(/\/@.+$/, '');
    }

    // Wicked Good XPath is having a problem with the Descendents (//)
    // operator. But any descendent operation seems to work when
    // prefixed with 'self::'.
    // https://github.com/google/wicked-good-xpath/issues/43
    xpath = xpath.replace(/\/\/(\w)/g, '//self::$1');

    // Execute XPath
    var xpathResult = dom.evaluate(xpath, dom, null, XPathResult.ANY_TYPE, null);
    if(attr) {
        return xpathResult.iterateNext().getAttribute(attr);
    } else {
        return xpathResult.iterateNext().textContent;
    }
}

// Utility function to set values for the template
function setNodeValue(dom, nodeName, value) {
    var node = dom.getElementsByTagName(nodeName)[0];
    node.parentNode.replaceChild(node.cloneNode(false).appendChild(document.createTextNode(value)).parentNode, node);
}

// Return the path to the XSLT stylesheet that is appropriate
// given the provided e-file form
function getStylesheetPath(templateDom, formId) {
    var year = templateDom.getElementsByTagName('ReturnVersion')[0].textContent.match(/\d+/)[0];
    return '{{ site.github.url}}/mef/Stylesheets/'+year+'/'+formId+'.xsl';
}

//======================================
//
// SUPPORT FUNCTIONS
//
//======================================

// Utility function to format TIN in XX-XXXXXXX format
function formatTIN(tin) {
    return tin.slice(0,2) + '-' + tin.slice(2);
}

// Utility function to format Date
// Input example: 2015-05-14T18:01:56-05:00
function formatDate(date) {
    return date.substring(0, date.indexOf('T')).replace(/\s/g, '');
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
