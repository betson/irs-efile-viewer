$(function() {
    $('#file-input').change(loadFile);
});

function loadFile() {
    var myFile = this.files[0];
    readXML(myFile).then(function(fileText) {
        sessionStorage.setItem('x', fileText);
        sessionStorage.setItem('x_name', myFile.name);
    }).catch(function(err) {
        console.log(err);
    });
}

function readXML(file) {
    return new Promise (function(resolve, reject) {
        if(!file.type.match(/.*xml/)) {
            reject(Error('Filetype not supported. Please select an XML file.'));
        } else {
            var reader = new FileReader();
            reader.onload = function(e) {
                resolve(e.target.result);
            };
            reader.onerror = function() {
                reject(Error('There was a problem loading the file.'));
            }
            reader.readAsText(file);
        }
    });
}
