$(document).ready(function () {
    $('#peopleCSVFile').change(function(e){
        var fileName = e.target.files[0].name;
        $('.custom-file-label').html(fileName);
    });
})