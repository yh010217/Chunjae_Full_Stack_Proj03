
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

let isItCheck = false;
document.getElementById('selectAll').onclick = function (){

    let check_one = document.querySelectorAll("input[name='lid']");
    let check_count = check_one.length;
    let checking = !isItCheck;
    isItCheck = !isItCheck;
    let sum = 0;
    for(let i = 0 ; i < check_count ; i++){
        check_one[i].checked = checking;
        if(checking){
            if(!check_one[i].classList.contains('cart_checked')){
                check_one[i].classList.add('cart_checked');
            }
            sum += parseInt(check_one[i].value.split('_')[1]);
        }else{
            if(check_one[i].classList.contains('cart_checked')){
                check_one[i].classList.remove('cart_checked');
            }
        }
    }
    document.getElementById('total_price').innerHTML = sum + ' 원';


}



let total_change = function (lid) {
    document.getElementById(lid).classList.toggle('cart_checked');

    let cart_arr = document.querySelectorAll('.cart_checked');
    let sum = 0;
    for (let i = 0; i < cart_arr.length; i++) {
        sum += parseInt(cart_arr[i].value.split('_')[1]);
    }
    document.getElementById('total_price').innerHTML = sum + ' 원';
}
