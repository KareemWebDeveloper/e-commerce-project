<template>

    <!-- *******LOADING******* -->
    <div class="bg" id="loading">
        <div class="ring">Loading
            <span class="loadSpan"></span>
        </div>
    </div>
    <!-- *******LOADING-END******* -->

<div class="heading">
    <hr>
    <h3 class="title">Footwear</h3>
    <hr>
</div>
<div class="Men">
    <div class="categories d-none d-lg-flex">
        <h2>Categories</h2>
        <hr class="categHr2">
        <RouterLink to="/all" class="category">All</RouterLink>
        <RouterLink to="/Men" class="category ">Men</RouterLink>
        <RouterLink to="/Women" class="category">Women</RouterLink>
        <RouterLink to="/footwear" class="category active">Footwear</RouterLink>
        <RouterLink to="/accessories" class="category">Accessories</RouterLink>
        <RouterLink to="/sales" class="category">Sales</RouterLink>
        <hr class="categHr">
        <i class="fa-solid fa-truck" style="color: white; font-size: 24px;"></i>
        <p>
            Cash on delivery fee is 10 EGP
        </p>
        <hr class="categHr">
        <i class="fa-solid fa-arrow-right-arrow-left" style="color: white; font-size: 24px;"></i>
        <p>
            Product Replacement at Store
            Buy online, change in store
        </p>
        <hr class="categHr">
        <i class="fa-solid fa-truck-ramp-box" style="color: white; font-size: 24px;"></i>
        <p>
            Easy & Free Return via Aramex
            Return Within 30 Days
        </p>

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
        <h2>Product added to the cart successfully .. go to checkout</h2> 
        <RouterLink class="checkOut" to="/cart" @click="closeMsg"><i class="fa-solid fa-cart-shopping" style="color: white; margin-right: 0.5vh;"></i> Cart</RouterLink>
    </div>
</div>

    <div class="products" id="details">
        <div class="card" v-if="!this.footwear.message" v-for="product in footwear.slice((currentPage - 1) * itemsPerPage , currentPage * itemsPerPage)">
            <div class="productImg">
                <RouterLink to="/productDetails"><img :src="`http://127.0.0.1:8000/images/products/${product.image}`" @click="ProductDetails(product.id)" class="prod" alt=""></RouterLink>
                <h3>{{ product.price }} EGP</h3>
                <RouterLink to="/productDetails"><span @click="ProductDetails(product.id)"><i class="fa-solid fa-eye appearOnHover hovv"></i></span></RouterLink>
            </div>
            <div class="productInfo">
                <h1>{{ product.title }}</h1>
                <hr style="margin: auto; width: 80%; height: 0.2vh;">
                <div class="rating">
                    <i class="fa-solid fa-star nocolor"></i>
                    <i class="fa-solid fa-star nocolor"></i>
                    <i class="fa-solid fa-star nocolor"></i>
                    <i class="fa-solid fa-star nocolor"></i>
                    <i class="fa-solid fa-star nocolor"></i>
                </div>
                <div>
                    <i class="fa-solid fa-heart prodIcons"></i> 
                    <button style="border: none; background-color: white;" @click="addToCart(product.id)"><i class="fa-solid fa-cart-shopping prodIcons"></i></button>   
                    <i class="fa-solid fa-share prodIcons"></i>
                </div>
            </div>
        </div>
        <h1 v-if="this.footwear.message" class="text-center m-auto">{{ footwear.message }}</h1>
    </div>
</div>
<div class="buttons">
    <hr>
    <button v-if="currentPage > 1" class="moreProducts" id="previous" @click="prevPage">Previous Page</button>  
    <button v-if="currentPage < totalPages" class="moreProducts" @click="nextPage">Next Page</button>  
    <hr>
</div>
</template>
<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Kaushan+Script&display=swap');
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
.checkOut:hover{
background-color: #e13ed7;
}

.activeCategory{
color: #e13ed7 !important;
border-bottom: 2px solid #505050;
padding-bottom: 0.2vh;
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
.Men{
display: flex;
width: 90%;
justify-content: center;  
}
.buttons{
display: flex;
margin: 2vh auto 5vh;
text-align: center;
align-items: center;
}
.buttons hr{
width: 35%;
margin: 0;
}
.buttons button{
margin: 0 auto;
width: 20vh;
border: none;
padding: 1.2vh 2vh;
background-color: #505050;
color: white;
border-radius: 5px;
cursor: pointer;
transition-duration: 0.2s;
}
.buttons button:hover{
background-color: #3c3c3c;
}
.categHr,.categHr2{
color: white;
background-color: white;
height: 0.5vh;
margin: 2vh auto;
width: 80%;
box-shadow: 0px 0px 10px black;
}
.categHr2{
margin-top: 1vh;
width: 100%;
}
.categories{
font-family: 'Kaushan Script', cursive;
display: flex;
flex-direction: column;
width: 30%;
padding: 2vh;
margin-left: 8vh;
margin-top: 2vh;
background-color: rgba(0, 0, 0, 0.701);
height: 100%;
border-radius: 5px;
}
.categories h2{
color: white;
padding: 1.5vh;
text-align: center;
font-size: 35px;
text-shadow: 0px 0px 2px black;
}
.categories p{
color: white;
padding: 1.5vh;
text-align: center;
cursor: default;
transition-duration: 0.2s;
}
.categories p:hover{
color: #e13ed7;
}
.active{
background-color: #e13ed7 !important;
border-radius: 12px;
}
.category{
width: 80%;
color: white;
text-decoration: none;
padding: 2vh;
text-align: center;
margin: 1vh auto;
transition-duration: 0.3s;
}
.category:hover{
background-color: rgb(0, 0, 0);
border-radius: 10px;
}
.products{
display: flex;
flex-wrap: wrap;
justify-content: center;
margin: 6vh auto;
margin-top: 0;
width: 100%;
}
.card{
display: flex;
flex-direction: column;
justify-content: center;
margin: 2vh;
}
.productImg{
position: relative;
cursor: pointer;
margin-bottom: 2vh;
background-color: black;
}
.prod{
opacity: 1;
transition-duration: 0.3s;
}
.productImg:hover .prod{
opacity: 0.5;
}
.productImg h3{
position: absolute;
top: 0%;
right: 0%;
background-color: black;
padding: 1vh;
color: white;
font-size: 15px;
}
.appearOnHover{
font-size: 28px;
color: white;
background-color: rgba(0, 0, 0, 0.649);
padding: 1vh;
border-radius: 50%;
position: absolute;
top: 50%;
left: 45%;
opacity: 0;
transition-duration: 0.3s;
}
.productImg:hover .appearOnHover{
opacity: 1;
}
.appearOnHover:hover{
background-color: rgba(0, 0, 0, 0);
}
.productInfo{
text-align: center;
display: flex;
flex-direction: column;
color: #575252;
}
.productInfo h1{
font-size: 20px;
width: 265px;
}
.rating{
display: flex;
margin: 1vh 0;
justify-content: center;
}
.nocolor,.prodIcons{
color: #c5c3c5;
margin: 0.2vh;
transition-duration: 0.2s;
cursor: pointer;
}
.nocolor:hover{
color: #e13ed7;
}
.prodIcons{
border: 1.5px solid #c5c3c5;
padding: 1vh;
border-radius: 50%;
margin: 0.6vh;
transition-duration: 0.2s;
}
.prodIcons:hover{
background-color: #c5c3c5;
color: #e13ed7;
}
.loadMore{
text-align: center;
margin: auto;
margin-bottom: 5vh;
margin-top: 0vh;
}
.startShopping{
text-decoration: none;
border: 2px solid #868383;
color: #505050;
padding: 1vh 3.5vh;
cursor: pointer;
transition-duration: 0.3s;
}
.startShopping:hover{
color: white;
background-color: black;
border: 2px solid black;
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
.loadSpan
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
.loadSpan:before
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
@media screen and (max-width: 1000px) {
.Men{
    margin: auto;
}
.products{
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    margin: 2vh auto;
}
.card{
    display: flex;
    flex-direction: column;
    justify-content: center;
    margin: 2vh;
}
}
</style>
<script>
import axios from 'axios'
export default {
data() {
    return {
        footwear : [],
        currentPage : 1,
        itemsPerPage : 6,
        token : ''
    }
},
computed : {
    totalPages(){
        return Math.ceil(this.footwear.length / this.itemsPerPage)
    },
    authenticated(){
        this.token = this.$store.state.token
        return this.$store.state.authenticated
    }
},
methods: {
    nextPage(){
        window.scrollTo(0,100)
        this.currentPage++;
    },
    closeMsg(){
        let LoginMessage = document.getElementById('LoginMessage')
        let succesMsg = document.getElementById('succesMsg')
        succesMsg.classList.add('d-none')
        LoginMessage.classList.add('d-none')
    },
    addToCart(id){
        if(!this.authenticated){
            let LoginMessage = document.getElementById('LoginMessage')
            LoginMessage.classList.remove('d-none')
        }
        else{
            axios.defaults.headers.common['Authorization'] = `Bearer ${this.token}`
            axios.post('http://127.0.0.1:8000/api/addToCart/'+ id).then((response)=> {
                let succesMsg = document.getElementById('succesMsg')
                succesMsg.classList.remove('d-none')

                // console.log(response.data);
        }).catch(function(error) {
            console.log(error.response.data.message);
        });
        }
    },
    ProductDetails(id){
        // console.log(id);
        window.scrollTo(0,0);
        axios.get('http://127.0.0.1:8000/api/proudcts/'+ id).then((response)=> {
            this.productDetailss = response.data.product;
            this.$store.state.productDetails = []
            this.$store.state.productDetails = this.productDetailss
            this.$store.state.path = 'footwear'
        }).catch(function(error) {
            console.log(error.response.data.message);
        });
    },
    prevPage(){
        window.scrollTo(0,100)
        this.currentPage--;
    }
},
beforeMount() {
    axios.get("http://127.0.0.1:8000/api/footwear").then((response)=> {
            if(response.data.message){
                this.footwear = response.data;
            }
            else{
                if(response.data.products){
                    this.footwear = response.data.products;
                }
            }
        })
},
mounted() {
    let loading = document.getElementById('loading')
    let details = document.getElementById('details')
    setTimeout(() => {
        loading.innerHTML = '';
        loading.classList.add('d-none')
    }, 1500);
    setTimeout(() => {
        details.classList.remove('d-none')
    }, 1400);
},
}
</script>



