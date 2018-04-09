var modal = document.getElementById('modal');
var producttitle = document.getElementById('producttitle');


var modalYes = document.getElementById('modalYes');
var modalNo = document.getElementById('modalNo');

var display = false;
var productId;

function toggleModal(){
    if(this.display){
        modal.style.display = 'none';
    } else {
        modal.style.display = 'block';
    };
    this.display = !this.display;
}

function deleteProduct(){
    var url = "controller/removeProduct/" + this.productId;
    window.location = url;
}

function confirmDelete(id, name){
    alert('params: ' + id + ", " + name);
    this.productId = id;
    this.producttitle.textContent = name;
    toggleModal();
}

