<template>
    <div class="heading">
        <hr>
        <h3 class="title">TRENDING ITEMS</h3>
        <hr>
    </div>
    <div class="products">
        <div class="card" v-for="product in AllFeatured">
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
   </div>
   <div class="loadMore">
       <RouterLink to="/all" class="startShopping" @click="scrolll">LOAD MORE</RouterLink>
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
</template>
<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');
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
.heading{
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 15vh ;
    margin-bottom: 5vh;
}
hr{
    width: 30%;
    height: 0.6vh;
    background-color: black;
    margin: 0 2vh;
}
.title{
    font-family: 'Roboto', sans-serif;
    text-align: center;
    font-weight: 700;
}
.products{
    width: 85%;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    margin: 6vh auto;
    margin-top: 0;
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
    width: 272px;
    height: 406px;
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
    font-size: 21px;
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
</style>
<script>
import axios from "axios";

export default {
    data() {
        return {
            AllFeatured : [],
            productDetailss : [],
            token : ''
        }
    },
    computed : {
        authenticated(){
            this.token = this.$store.state.token
            return this.$store.state.authenticated
        }
    },
    methods : {
        scrolll(){
            window.scrollTo(0,60)
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
            }).catch(function(error) {
                console.log(error.response.data.message);
            });
            }
        },
        closeMsg(){
            let LoginMessage = document.getElementById('LoginMessage')
            let succesMsg = document.getElementById('succesMsg')
            succesMsg.classList.add('d-none')
            LoginMessage.classList.add('d-none')
        },
        ProductDetails(id){
            window.scrollTo(0,0);
            axios.get('http://127.0.0.1:8000/api/proudcts/'+ id).then((response)=> {
                this.productDetailss = response.data.product;
                this.$store.state.productDetails = []
                this.$store.state.productDetails = this.productDetailss
                this.$store.state.path = 'Trending'
            }).catch(function(error) {
                console.log(error.response.data.message);
            });
        }
    },
    beforeMount() {
        axios.get("http://127.0.0.1:8000/api/Featured").then((response)=> {
                this.AllFeatured = response.data.products;
            })
    },

}
</script>