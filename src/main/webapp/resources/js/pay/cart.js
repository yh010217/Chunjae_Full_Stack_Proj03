


document.getElementById('multi_button').onclick = function (){

    let purchase_arr = document.querySelectorAll('.cart_checked');
    let str_lid='';
    let i = 0;
    for(i ; i < purchase_arr.length - 1 ; i++){
        str_lid += purchase_arr[i].id+"_";
    }
    str_lid += purchase_arr[i].id;

    location.href = 'purchase_cart?lid='+str_lid;

}






