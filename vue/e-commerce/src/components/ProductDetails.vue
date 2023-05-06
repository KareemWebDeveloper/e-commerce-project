<template>
    <!-- *******LOADING******* -->
    <div class="bg" id="loading">
        <div class="ring">Loading
            <span></span>
        </div>
    </div>
    <!-- *******LOADING-END******* -->
    <!-- *******product Details******* -->
    <h6 class="path">Home Page <i class="fa-solid fa-angle-right mx-1"></i> {{path}} <i class="fa-solid fa-angle-right mx-1"></i> {{ productDetails.title }}</h6>
    <div class="productDetails d-none" id="details">
        <img :src="`http://127.0.0.1:8000/images/products/${productDetails.image}`" class="prod" alt="">
        <div class="ProdDescription">
            <div class="title">
                <h3>{{ productDetails.title }}</h3>
                <div class="d-flex">
                    <i class="fa-solid fa-heart prodIcons"></i> 
                    <i class="fa-solid fa-share prodIcons"></i>
                </div>
            </div>
            <hr>
            <div class="price">
                <h6><i class="fa-solid fa-dollar-sign"></i> Cash Price :</h6>
                <h5>{{ productDetails.price }} EGP</h5>
            </div>
            <hr>
            <div class="descr">
                <h6> Description :</h6>
                <h5>{{ productDetails.description }}</h5>
            </div>
            <hr>
            <div class="count">
                <h6> Pieces Left :</h6>
                <h5>{{ productDetails.count }}</h5>
            </div>
            <div class="rating">
                <i class="fa-solid fa-star nocolor"></i>
                <i class="fa-solid fa-star nocolor"></i>
                <i class="fa-solid fa-star nocolor"></i>
                <i class="fa-solid fa-star nocolor"></i>
                <i class="fa-solid fa-star nocolor"></i>
            </div>
        </div>
        <div class="buttons">
            <!-- <h5>QUANTITY</h5> -->
            <input type="number" name="quantity" v-model="this.FormData.quantity" placeholder="Enter Product Quantity ..">
            <h6 id="quantityError" class="text-danger text-center d-none">There is should be at least one product</h6>
            <RouterLink to="" class="addToCart" @click="addToCart(productDetails.id)"><i class="fa-solid fa-cart-shopping mx-1"></i>ADD TO CART</RouterLink>
        </div>
    </div>

<!-- ****** only appear if the user tries to add to cart without being authenticated ****** -->

    <div class="overlay d-none" id="LoginMessage">
        <div class="LoginFirst">
            <h1 @click="closeMsg"><i class="fa-solid fa-x"></i></h1>
            <h2>Please Login First So You Can Add Products To Your Cart!</h2>
            <RouterLink class="login" to="/login" @click="closeMsg">Login</RouterLink>
        </div>
    </div>

<!-- ****** only appear if the user added a product to the cart and success ****** -->

    <div class="overlay d-none" id="succesMsg">
        <div class="LoginFirst">
            <h1 @click="closeMsg"><i class="fa-solid fa-x"></i></h1>
            <i class="fa-solid fa-check" style="background-color: green; padding: 1.5vh; border-radius: 50%; color: white;"></i>
            <h2>Product added to the cart successfully</h2> 
            <RouterLink class="login" to="/cart" @click="closeMsg"><i class="fa-solid fa-cart-shopping" style="color: white; margin-right: 0.5vh;"></i> Go To Checkout</RouterLink>
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
.login , .checkOut{
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
hr{
    width: 70%;
}
.rating{
    display: flex;
}
.nocolor{
    color: #c5c3c5;
    margin: 0.2vh;
    transition-duration: 0.2s;
    cursor: pointer;
}
.nocolor:hover{
color: #e13ed7;
}
.count{
    display: flex;
    align-items: center;
}
.buttons{
    display: flex;
    flex-direction: column;
    justify-content: center;
    width: 30%;
}
.buttons input{
    padding: 1vh;
    border-radius: 3px;
    margin: 2vh 0;
}
.addToCart{
    text-align: center;
    background-color: #193db0;
    color: white;
    padding: 1.5vh 5vh;
    border-radius: 4px;
    text-decoration: none;
    transition-duration: 0.2s;
}
.addToCart:hover{
    background-color: #0035e4;
}
.count h6{
    color: #6b778d;
    font-size: 15px;
    margin-right: 1vh;
}
.path{
    color: #6b778d;
    font-size: 14px;
    text-align: center;
    margin-top: 15vh;
    margin-bottom: 2vh;
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
span
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
span:before
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
.productDetails{
    background-color: white;
    display: flex;
    width: 80%;
    justify-content: center;
    margin: 0vh auto 15vh;
}
.productDetails img{
    box-shadow: -2px -2px 10px rgba(0, 0, 0, 0.807);
    border-radius: 5px;
    width: 272px;
    height: 406px;
    margin-top: 2vh;
}
.ProdDescription{
    margin: 5vh;
    color: #353232;
}
.ProdDescription .title{
    display: flex;
    align-items: center; 
    margin: 2.5vh 0;
}
.ProdDescription .title h3{
    margin-right: 5vh;
    width: 54%;
}
.price h6{
    color: #6b778d;
    font-size: 15px;
}
.price h5{
    color: #193db0;
    font-size: 22px;
    padding-left: 0.2vh;
}
.prodIcons{
    margin: 0 0.7vh;
    font-size: 26px;
    color: #353232;
    border: 0.5px solid rgba(26, 25, 25, 0.629);
    padding: 0.5vh;
    box-shadow: 1px -1px 5px rgba(0, 0, 0, 0.681);
    border-radius: 5px;
    cursor: pointer;
    transition-duration: 0.2s;
}
.descr{
    margin-top: 2vh;
}
.descr h6{
    color: #6b778d;
    font-size: 15px;
}
.descr h5{
    width: 65%;
    font-size: 16px;
}
.prodIcons:hover{
    background-color: #292626;
    color: rgba(255, 255, 255, 0.935);
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
@media screen and (max-width: 900px){
    .productDetails{
        display: flex;
        flex-direction: column;
        justify-content: center;
    }
    .productDetails img{
        margin: auto;
    }
    .ProdDescription{
        text-align: center;
        margin-top: 1vh;
    }
    .title{
        display: flex;
        flex-direction: column;
    }
    .title h3{
        width: 100% !important;
        margin-right: 0 !important;
    }
    hr{
        margin: 2vh auto;
    }
    .descr h5{
        text-align: center;
        width: 75%;
        margin: 0;
        padding: 0;
        margin: auto;
    }
    .count{
        justify-content: center;
    }
    .rating{
        justify-content:center ;
    }
    .buttons{
        width: 90%;
        margin: auto;
    }
}
</style>
<script>
import axios from "axios";
export default {
    data() {
        return {
            productDetailss: [],
            path: '',
            token : '',
            FormData:{
                quantity : '1',
            },
        }
    },
    computed:{
        productDetails(){ // gets the product details from the vuex store initiallized in the main.js file
            this.productDetailss = this.$store.state.productDetails
           return this.$store.state.productDetails
        },
        path(){  // gets the product path from the vuex store initiallized in the main.js file
            this.productDetailss = this.$store.state.path
           return this.$store.state.path
        },
        authenticated(){ // checks if the user is authenticated
            this.token = this.$store.state.token
            return this.$store.state.authenticated
        }
    },
    mounted() {
        let loading = document.getElementById('loading')
        let details = document.getElementById('details')
        setTimeout(() => {
            loading.classList.add('d-none')
        }, 1500);
        setTimeout(() => {
            details.classList.remove('d-none')
        }, 1400);
    },
    beforeMount() {
        setTimeout(() => {
    if(!this.productDetailss.id){
        window.history.back()
        window.scrollTo(0,50)
    }
        }, 1000);
},
    methods: {
        goBack(){
            window.history.back()
            window.scrollTo(0,30)
            console.log('kimo');
        },
        addToCart(id){ // add product to cart if authenticated
            if(!this.authenticated){
                let LoginMessage = document.getElementById('LoginMessage')
                LoginMessage.classList.remove('d-none')
            }
            else{
                if(this.FormData.quantity < 1){
                    let quantityError = document.getElementById('quantityError');
                    quantityError.classList.remove('d-none')
                }
                else{
                quantityError.classList.add('d-none')
                axios.defaults.headers.common['Authorization'] = `Bearer ${this.token}`
                axios.post('http://127.0.0.1:8000/api/addToCart/'+ id , this.FormData).then((response)=> {
                    console.log(response.data);
                    let succesMsg = document.getElementById('succesMsg')
                    succesMsg.classList.remove('d-none')
                }).catch(function(error) {
                    console.log(error.response.data.message);
                });
            }
        }
        },
        closeMsg(){
            let LoginMessage = document.getElementById('LoginMessage')
            let succesMsg = document.getElementById('succesMsg')
            succesMsg.classList.add('d-none')
            LoginMessage.classList.add('d-none')
        }
    }

}
</script>