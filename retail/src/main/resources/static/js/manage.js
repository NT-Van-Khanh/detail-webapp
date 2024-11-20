function readURL(input){
    if(input.files && input.files[0]){
        document.getElementById('blah').src = window.URL.createObjectURL(input.files[0]);
        document.getElementById('blah').style.display = 'block';
    }
}

function updateBrandInputValue(){
    var selectedBrandId = document.getElementById("brand-select").value;
    document.getElementById("brand-id").value = selectedBrandId;
}
function updateUnitInputValue(){
    var selectedBrandId = document.getElementById("unit-select").value;
    document.getElementById("unit-id").value = selectedBrandId;
}
function redirectToProduct(element) {
    var productId = element.getAttribute('data-id');
    window.location.href = '/manage/edit-product/' + productId;
}
function redirectToCustomer(element) {
    var customerId = element.getAttribute('data-id');
    window.location.href = '/manage/detail-customer/' + customerId;
}
function confirmDelete(){
    const deleteButton = document.querySelector("button[type='submit'][name='action'][value='delete']");
    if(deleteButton){
        deleteButton.addEventListener('click', function(event) {
            if (!confirm("Bạn có chắc chắn muốn xóa sản phẩm này không?")) {
                event.preventDefault();
            }
        });
    }
    const updateButton = document.querySelector("button[type='submit'][name='action'][value='update']");
    if (updateButton) {
        updateButton.addEventListener('click', function(event) {
            if (!confirm("Bạn có chắc chắn muốn cập nhật sản phẩm này không?")) {
                event.preventDefault();
            }
        });
    }
}

document.addEventListener('DOMContentLoaded', confirmDelete);