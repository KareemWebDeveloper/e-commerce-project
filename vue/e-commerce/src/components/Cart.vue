<template>
    <div v-if="!productsLoaded">    
        <!-- *******LOADING******* -->
        <div class="bg" id="loading">
            <div class="ring">Loading
                <span class="loadingSpan"></span>
            </div>
       </div>
       <!-- *******LOADING-END******* -->
    </div>

    <!--  ******* Message Appears only if the cart is empty ******* -->
    <div v-if="NoProducts" class="m-auto" style="padding: 20vh; display: flex; flex-direction: column; justify-content: center;">
        <h1 class="text-center m-4">There is no products in your cart</h1>
        <RouterLink to="/" style="margin: auto; text-align: center; text-decoration: none; font-size: 20px;">Continue Shopping</RouterLink>
    </div>  
    <div v-else>
        <div class="heading">
            <hr>
            <h3 class="title">SHOPPING CART</h3>
            <hr>
        </div>
        <!-- Confirm Remove Message -->
    <!-- ****** ONLY APPEARS WHEN USER TRIES TO REMOVE A PRODUCT FROM THE CART ***** -->
    <div class="overlay d-none" id="RemoveProdMsg">
        <div class="LoginFirst">
            <h1 @click="closeMsg"><i class="fa-solid fa-x"></i></h1>
            <i v-if="productDeleted" class="fa-solid fa-check" style="background-color: green; padding: 1.5vh; border-radius: 50%; color: white;"></i>
            <h2 id="removeMsg" v-if="!productDeleted">Are You sure You Want To Remove This Product From Your Cart?</h2>
            <h2 id="removeMsg" v-if="productDeleted">The Product Has Been Removed From Your Cart</h2>
            <RouterLink class="login" v-if="!productDeleted" to="" @click="removeProduct">Yes</RouterLink>
            <RouterLink class="login" v-if="!productDeleted" to="" @click="closeMsg">No</RouterLink>
        </div>
    </div>
    <!--****** Confirm Remove Message end *******-->

        <!-- ******* show user's cart product ************ -->
        <div class="cart">
            <div class="allCartProds">
                <div class="productInfo" id="cartprodsss" v-for="(product, index) in productsDetails">
                <img :src="`http://127.0.0.1:8000/images/products/${product.image}`" alt="">
                <div class="right">
                    <p>{{ product.title }}</p>
                    <h4 ><span id="SubT">{{ product.price }}</span> EGP</h4>
                    <p>Remaining : {{ product.count }}</p>
                        <button class="remove" @click="ViewRemoveMsg(productsId[index].id)"><i class="fa-solid fa-trash"></i> Remove</button>
                    <p>Estimated Delivery Date: <span id="deliveryDate">{{ date }}</span></p>
                    <p class="creditt">We Accept : <i class="fa-brands fa-cc-visa" style="font-size: 21px; margin:0 0.4vh;"></i> <i class="fa-brands fa-cc-mastercard" style="font-size: 21px; margin:0 0.4vh;"></i> <i class="fa-brands fa-paypal" style="font-size: 21px; margin:0 0.4vh;"></i> <i class="fa-brands fa-cc-amazon-pay" style="font-size: 21px; margin:0 0.4vh;"></i></p>
                </div>
                <div class="quantity">
                    <h5>Quantity</h5>
                    <div style="display: flex; align-items: center;">
                        <button class="off" @click="minus(product.price,`quantity${product.id}`,`minusButton${product.id}`)" :id="`minusButton${product.id}`">-</button>
                        <h1 :id="`quantity${product.id}`">{{ productsId[index].quantity }}</h1>
                        <button @click="plus(product.price,`quantity${product.id}`,`minusButton${product.id}`)">+</button>
                    </div>
                </div>
            </div>
            <div class="totalPrice">
                <h5>TOTAL AMOUNT : <span id="totalPrice">{{ TotalPrice + 40 }}</span><span> EGP</span></h5>
                <hr class="mb-3">
                <p>SubTotal : <span id="price">{{ TotalPrice }}</span></p>
                <p class="mb-4">Delivery : <span id="deliveryPrice">40 EGP</span></p>
                <RouterLink to="/" class="complete" style="margin: 5vh auto;">Complete Order</RouterLink>
                <p class="mt-3" style="font-size: 13px;">INCLUDING 13% TAX</p>
            </div>
        </div>      
    </div>
</div>
</template>
<style scoped>
.overlay{
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.593);
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 99;
}
.LoginFirst{
    position: relative;
    background-color: white;
    padding: 10vh;
    border-radius: 10px;
    z-index: 9;
    text-align: center;
    width: 45%;
}
.LoginFirst h1{
    position: absolute;
    right: 6vh;
    top: 4vh;
    font-size: 22px;
    cursor: pointer;
}
.LoginFirst h2{
    font-size: 27px;
    width: 90%;
    text-align: center;
    margin: 2vh auto 5vh;
}
.login{
    margin: 0 1vh;
    background-color: black;
    color: white;
    text-decoration: none;
    padding: 1.5vh 2.5vh;
    border-radius: 7px;
    transition-duration: 0.3s;
}
.login:hover{
    background-color: rgba(0, 0, 0, 0.697);
}
.checkOut:hover{
    background-color: #e13ed7;
}
.bg{
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgb(255, 255, 255);
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 99;
}
.ring
{
  position:absolute;
  top:50%;
  left:50%;
  transform:translate(-50%,-50%);
  width:150px;
  height:150px;
  background:black;
  border:3px solid #3c3c3c;
  border-radius:50%;
  text-align:center;
  line-height:150px;
  font-family:sans-serif;
  font-size:20px;
  color:#e13ed7;
  letter-spacing:4px;
  text-transform:uppercase;
  text-shadow:0 0 10px #e13ed7;
  box-shadow:0 0 20px rgba(0,0,0,.5);
}
.ring:before
{
  content:'';
  position:absolute;
  top:-3px;
  left:-3px;
  width:100%;
  height:100%;
  border:3px solid transparent;
  border-top:3px solid #e13ed7;
  border-right:3px solid #e13ed7;
  border-radius:50%;
  animation:animateC 2s linear infinite;
}
.loadingSpan
{
  display:block;
  position:absolute;
  top:calc(50% - 2px);
  left:50%;
  width:50%;
  height:4px;
  background:transparent;
  transform-origin:left;
  animation:animate 2s linear infinite;
}
.loadingSpan:before
{
  content:'';
  position:absolute;
  width:16px;
  height:16px;
  border-radius:50%;
  background:#e13ed7;
  top:-6px;
  right:-8px;
  box-shadow:0 0 20px #e13ed7;
}
@keyframes animateC
{
  0%
  {
    transform:rotate(0deg);
  }
  100%
  {
    transform:rotate(360deg);
  }
}
@keyframes animate
{
  0%
  {
    transform:rotate(45deg);
  }
  100%
  {
    transform:rotate(405deg);
  }
}
.heading{
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 15vh ;
    margin-bottom: 5vh;
}
hr{
    width: 35%;
    height: 0.6vh;
    background-color: black;
    margin: 0 2vh;
}
.title{
    font-family: 'Kaushan Script', cursive;
    text-align: center;
    font-weight: 700;
}
.cart{
    display: flex;
    justify-content: center;
    margin-bottom: 2vh;
}
.productInfo{
    display: flex;
    padding: 2vh;
    margin-right: 8vh;
    width: 100%;
    border: 1px solid #e1e1e1;
}
.productInfo img{
    width: 20%;
}
.right{
    margin: 2vh 3vh;
}
.remove{
    border: none;
    color: rgba(0, 0, 0, 0.79);
    background-color: rgba(0, 0, 0, 0);
    transition-duration: 0.2s;
    margin-bottom: 3vh;
}
.remove:hover{
    color: black;
}
.quantity{
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    padding: 10vh;
    margin: auto 4vh;

}
.quantity h5{
    margin: 2vh;
}
.quantity button{
    width: 7vh;
    padding: 1.5vh;
    text-align: center;
    font-size: 25px;
    background-color: #e13ed6dc;
    border: none;
    margin: 0 2vh;
    border-radius: 4px;
    transition-duration: 0.2s;
}
.totalPrice{
    margin: 4vh auto;
    text-align: center;
    border: 1px solid #e9e8ea;
    padding: 2vh;
    width: 60%;
    background-color: rgba(151, 151, 151, 0.136);
    box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.647);
    border-radius: 4px;
}
.creditt{
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: #e9e8ea;
    padding: 1vh;
    border-radius: 6px;
    text-align: center;
}
.complete{
    margin-top: 4vh;
    background-color: black;
    color: white;
    text-decoration: none;
    padding: 1.5vh 5vh;
}
.totalPrice hr{
    width: 90%;
    margin: 1vh auto;
    height: 0.1vh;
}
.off{
    background-color: #e13ed69f !important;

}
.quantity button:hover{
    background-color: #e13ed6;
}
@media screen and (max-width: 1000px){
.cart , .productInfo{
    display: flex;
    flex-direction: column;
}
.productInfo{
    width: 95%;
    margin: auto;
}
.productInfo img{
    width: 80%;
    margin: auto;
}
.quantity{
    margin: 1vh auto;
}
.totalPrice{
    width: 90%;
    margin: 2vh auto;
}
}
</style>
<script>
import axios from 'axios'
export default {
    data() {
        return {
            date: " ",
            productsId : [],
            productsDetails : [],
            productsLoaded : false,
            TotalPrice : 0,
            productDeleted : false,
            removeProductId: null,
            NoProducts : false
        }
    },
    methods: {
        minus(price,buttonId,minus){   // change product quantity and total price when clicking on minus button
            let counter = document.getElementById(buttonId);
            let minusButton = document.getElementById(minus)
            if(counter.textContent > 1){
                minusButton.classList.remove('off')
                counter.innerText = parseInt(counter.textContent) - 1
                this.TotalPrice = this.TotalPrice - price
            }
            else{
                minusButton.classList.add('off')
            }
        },
        plus(price,buttonId,minus){  // change product quantity and total price when clicking on plus button
            let counter = document.getElementById(buttonId);
            let minusButton = document.getElementById(minus)
                minusButton.classList.remove('off')
                counter.innerText = parseInt(counter.textContent) + 1
                this.TotalPrice = this.TotalPrice + price
        },
        ViewRemoveMsg(id){  // views the remove confirmation message before deleting a product from the cart
            this.removeProductId = id
            let RemoveProdMsg = document.getElementById('RemoveProdMsg')
            RemoveProdMsg.classList.remove('d-none')
        },
        closeMsg(){
            let RemoveProdMsg = document.getElementById('RemoveProdMsg')
            RemoveProdMsg.classList.add('d-none')
        },
        removeProduct(){ // remove product from the cart
            let id = this.removeProductId
            let token = this.$store.state.token
            axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
            axios.delete('http://127.0.0.1:8000/api/cart/remove/' + id).then((response)=> {
                        console.log(response.data.message);
                        this.productDeleted = true;
                        setTimeout(() => {
                            location.reload();
                        }, 800);
                })
        },
        
    },
    mounted() {
        let token = this.$store.state.token
        axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
        axios.get('http://127.0.0.1:8000/api/showCart').then((response)=> {
            console.log(response.data.message);
            this.productsId = response.data.message;
                for (let i = 0; i < this.productsId.length; i++) {
                    let id = this.productsId[i].product_id
                    axios.get('http://127.0.0.1:8000/api/proudcts/' + id).then((response)=> {
                        this.productsDetails.push(response.data.product)
                    })
                }
            console.log(this.productsDetails);
        }).catch((error)=> {
            if(error.response.data.notFound){
                this.NoProducts = true;
                this.productsLoaded = true;
            }
        });
        
        setTimeout(() => {
            this.productsLoaded = true;
            let price = 0
            let counter = 0
            this.productsDetails.forEach((product)=>{
                price = (product.price * this.productsId[counter].quantity) + price
                counter++;
            })
            this.TotalPrice = price        
        }, 4500);

            //********* this calculates tha estimated delivery date ********

            var currentDateWithFormat = new Date().toJSON().slice(5,10).replace(/-/g,'/');
            // console.log(currentDateWithFormat);
            var deliveryDateDay = new Date().toJSON().slice(8,10).replace(/-/g,'/');
            var deliveryDateMonth = new Date().toJSON().slice(5,7).replace(/-/g,'/');
            if(deliveryDateDay>27){
                let newMonth = (parseInt(deliveryDateMonth)+1);
                let deliveryDateDayy = 3;
                let delivery = '2023/' + currentDateWithFormat + ' - 2023/' + newMonth + '/' + deliveryDateDayy  ;
                // console.log(delivery);
                this.date = delivery;
            }
            else{
                deliveryDateDay = parseInt(deliveryDateDay)+4;
                let delivery= '2023/' + currentDateWithFormat + ' - 2023/' + deliveryDateMonth + '/' + deliveryDateDay;
                // console.log(delivery);
                this.date = delivery;
            }


        }
    }
</script>