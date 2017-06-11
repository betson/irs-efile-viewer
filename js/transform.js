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
