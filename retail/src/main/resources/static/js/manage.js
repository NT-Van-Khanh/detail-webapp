function readURL(input){
    if(input.files && input.files[0]){
        document.getElementById('blah').src = window.URL.createObjectURL(input.files[0]);
        document.getElementById('blah').style.display = 'block';
    }
}
