---
---
var inputFile = '{{ site.github.url}}/201541349349307794_public.xml';

$(function() {
    gatherInputXML();
});

// Attempt to load the user-provided XML e-file. Due to the
// asynchronous request, this function will trigger all processing
// on the loaded files.
function gatherInputXML() {
    var templateFile = '{{ site.github.url}}/form_template.xml';
    Promise.all([
        loadXML(inputFile),
        loadXML(templateFile)
    ]).then(function(responses) {
        addXMLToPage(responses[0], responses[1]);

        return responses;
    }).catch(function(error) {
        console.log(error);
    });
}

function addXMLToPage(inputDom, templateDom) {
    var inputFilename = inputDom.documentURI ? inputDom.documentURI.substring(inputDom.documentURI.lastIndexOf('/')+1) : 'IRS e-File';
    $('#input-filename').text('Loaded: ' + inputFilename);

    var forms = getListOfForms(inputDom);
    forms.forEach(function(formName) {
        $('#forms-list').append(
            $('<li>').append(
                $('<a>').attr('href', '#').append(formName)
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
