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
    <div class="heading">
        <hr>
        <h3 class="title">SEARCH RESULTS</h3>
        <hr>
    </div>
    <div class="results">
        <h1 v-if="noResults" class="text-center">There are no results found</h1>
        <div class="result" v-for="(result,index) in results">
            <img :src="`http://127.0.0.1:8000/images/products/${result.image}`" alt="">
            <div class="resultInfo">
                <p class="ResultTitle" @click="ProductDetails(index)">{{ result.title }}</p>
                <p class="resDescription">{{ result.description }}</p>
            </div>
            <div class="buttons">
                <RouterLink to="" class="links" @click="addToCart(result.id)">Add To Your Cart <i class="fa-solid fa-cart-shopping"></i></RouterLink>
                <RouterLink to="" class="links" @click="ProductDetails(index)">Show Product <i class="fa-solid fa-basket-shopping mx-1"></i></RouterLink>
            </div>
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
        <h2>Product added to the cart successfully .. go to checkout</h2> 
        <RouterLink class="checkOut" to="/cart" @click="closeMsg"><i class="fa-solid fa-cart-shopping" style="color: white; margin-right: 0.5vh;"></i> Cart</RouterLink>
    </div>
</div>
</template>
<style scoped>
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
.results{
    width: 55%;
    margin: 5vh auto;
    display: flex;
    flex-direction: column;
    justify-content: center;
}
.result{
    display: flex;
    padding: 1vh 2vh;
    border-radius: 4px;
    margin: 0.2vh 0;
    border: 1px solid #3c3c3c;
    background-color: #3c3c3c1f;
}
.result img{
    width: 15%;
    margin-right: 2vh;
}
.ResultTitle{
    font-size: 19px;
    font-weight: bold;
    padding-top: 3vh;
    cursor: pointer;
    transition-duration: 0.2s;
}
.ResultTitle:hover{
    color: #0d6efd;
}
.resDescription{
    width: 80%;
}
.resultInfo{
    width: 80%;
}
.buttons{
    display: flex;
    flex-direction: column;
    padding: 2vh;
    width: 50%;
}
.links{
    text-decoration: none;
    background-color: #1a1b20;
    padding: 1.5vh 2.5vh;
    margin: 2vh;
    width: 100%;
    border-radius: 10px;
    transition-duration: 0.2s;
    color: white;
    text-align: center;
}
.links:hover{
    background-color: #1a1b20d8;
    color: #0d6efd;
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

</style>
<script>
import axios from 'axios';
export default {
    data() {
        return {
            token : '',
            noResults: false
        }
    },
    computed: {
        results(){ // get the search results from the vuex store 
            return this.$store.state.searchResults
        },
        authenticated(){
            this.token = this.$store.state.token
            return this.$store.state.authenticated
        }
    },
    mounted() {
        let loading = document.getElementById('loading')
        setTimeout(() => {
            loading.classList.add('d-none')
        }, 1000);
        if(this.results.length < 1){
            this.noResults = true
            setTimeout(() => {
            this.$router.push('/')
            }, 2500);
        }
    },
    methods: {
        ProductDetails(index){
            this.$store.state.productDetails = this.$store.state.searchResults[index]
            this.$store.state.path = 'search'
            this.$router.push('/productDetails')
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
        closeMsg(){
            let LoginMessage = document.getElementById('LoginMessage')
            let succesMsg = document.getElementById('succesMsg')
            succesMsg.classList.add('d-none')
            LoginMessage.classList.add('d-none')
        }
    },
}
</script>