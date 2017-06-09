---
---
var inputFile = '{{ site.github.url}}/201541349349307794_public.xml';
var templateFile = '{{ site.github.url}}/form_template.xml';
var inputDom;
var templateDom;

$(function() {
    gatherInputXML();
});

function gatherInputXML() {
    loadXML(inputFile).then(function(response) {
        inputDom = response;
        $('#input-filename').text('Loaded: ' + inputFile.substring(inputFile.lastIndexOf('/')+1));

        // Chain and request the next file
        return loadXML(templateFile);
    }).then(function(response) {
        templateDom = response;
    }).catch(function(error) {
        console.log(error);
    })
}

// A Promise that requests and returns a parsed XML Dom
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
