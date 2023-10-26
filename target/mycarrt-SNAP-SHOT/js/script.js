function add_tO_cart(pid,pname,price)
{
    let cart=localStorage.getItem("cart");
if(cart==null)
    {
        let products=[];
        let product = {productId: pid, productName: pname, productQuantity : 1,productPrice : price} 
        products.push(product);
        localStorage.setItem("cart",JSON.stringify(products));
        console.log("Product has addedd");
    }else
    {
        let pcart=JSON.parse(cart);
        let oldproduct=pcart.find((item)=>item.productId == pid)
        console.log("old product");
        if(oldproduct){
          oldproduct.productQuantity =oldproduct.productQuantity + 1
          pcart.map((item)=>{
           if(item.productId==oldproduct.productId)
           {
               item.productQuantity=oldproduct.productQuantity;
           }
       })
            localStorage.setItem("cart",JSON.stringify(pcart));
            console.log("Product has Increased");
        }else{
            let product = {productId: pid, productName: pname, productQuantity : 1,productPrice : price} 
       pcart.push(product)
       localStorage.setItem("cart",JSON.stringify(pcart));
          console.log("Product is added");
        }

    }
    updateCart();
}

function updateCart()
{
    let cartString=localStorage.getItem("cart");
    let cart=JSON.parse(cartString);
    if(cart==null || cart.length==0)
    {
        console.log("cart is empty !!")
        $(".cart-items").html("(0)");
        $(".cart-body").html("<h3>Cart does not have any  items...</h3>");
        $(".checkout-btn").addClass('disabled');
    }else
    {
        console.log(cart)
        $(".cart-items").html(`(${cart.length})`);
        let table=`
                <table class='table'>
        <thead class='thread-light'>
        <tr>
        <th>Item Name</th>
        <th> Price</th>
        <th> Quantity</th>
        <th> Total Price</th>
        <th> Action</th>
        </tr>
        
        </thead>
        
        `;
        
        let totalPrice=0;
        
       cart.map((item)=>{
           
           table+=`
<tr>
<td> ${item.productName}</td>            
<td> ${item.productPrice}</td>            
<td> ${item.productQuantity}</td>            
<td> ${item.productQuantity*item.productPrice}</td>            
<td> <button onclick='delteItemFromCart(${item.productId})' class='btn btn-danger btn-sm' >Remove</button></td>        

</tr>
            


`
            
      totalPrice+=item.productPrice*item.productQuantity;
     
           
       })
        
        table=table +  `
<tr><td colspan='5' style="text-align:right; margin-top:10px; font-family=sans-serif;">Total Price : ${totalPrice}</td></tr>
</table>`
      $(".cart-body").html(table);
$(".checkout-btn").removeClass('disabled');
       
    }
}
//delete item
function delteItemFromCart(pid)
{
let cart=  JSON.parse(localStorage.getItem('cart'));  
let newcart=cart.filter((item)=>item.productId !=pid)
localStorage.setItem('cart',JSON.stringify(newcart))
updateCart();
}

$(document).ready(function(){
    updateCart()
})

function gotoCheckout()
{
    window.location="checkout.jsp"
}