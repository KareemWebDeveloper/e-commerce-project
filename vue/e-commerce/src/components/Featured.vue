<template>
    

   <!-- **************** categories *********** -->

    <div class="heading">
        <hr>
        <h3 class="title">FEATURED ITEMS</h3>
        <hr>
    </div>
    <div class="categories">
        <RouterLink to="" id="allLink" class="links activeCategory" @click="SwitchToAll">ALL</RouterLink>
        <RouterLink to="" id="menLink" class="links" @click="SwitchToMen">MEN</RouterLink>
        <RouterLink to="" id="womenLink" class="links" @click="SwitchToWomen">WOMEN</RouterLink>
        <RouterLink to="" id="kidsLink" class="links" @click="SwitchToKids">KIDS</RouterLink>
    </div>

   <!-- **************** products api section *********** -->

        <!-- **************** all categories ************ -->
        <div class="products" id="all">
        <div class="card" v-for="product in AllFeatured">
            <div class="productImg">
                <RouterLink to="/productDetails"><img :src="`http://127.0.0.1:8000/images/products/${product.image}`" class="prod" alt="" @click="ProductDetails(product.id)"></RouterLink>
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

        <!-- **************** Men categories ************ -->


<div class="products none" id="men">
    <div class="card" v-if="!this.MenCategory.message" v-for="product in MenCategory.slice(0, 8)">
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
    <h1 v-if="this.MenCategory.message" class="text-center">{{ MenCategory.message }}</h1>
</div>

        <!-- **************** WOMEN categories ************ -->


<div class="products none" id="women">
    <div class="card" v-if="!this.WomenCategory.message" v-for="product in WomenCategory.slice(0, 8)">
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
    <h1 v-if="this.WomenCategory.message" class="text-center">{{ WomenCategory.message }}</h1>
</div>

        <!-- **************** KIDS categories ************ -->


<div class="products none" id="kids">
    <div v-if="!this.KidsCategory.message">
    <div class="card" v-for="product in KidsCategory.slice(0, 8)">
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

    <h1 v-if="this.KidsCategory.message" class="text-center">{{ KidsCategory.message }}</h1>
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
   <!-- **************** advertise section *********** -->

    <div class="advertisee d-none d-lg-flex">
        <div class="left">
            <RouterLink to="/Women" @click="scrolltoppp"><img src="../images/ad 2.png" alt=""></RouterLink>
            <div class="text">
                <h1 style="display: flex; justify-content: center; align-items: center; color: black;">70% <span class="off" style="font-size: 20px; writing-mode:vertical-rl">OFF</span> </h1> 
                <h3>ON WOMEN ACCESSORIES</h3>
            </div>
        </div>
        <div class="right">
            <RouterLink to="/Men" @click="scrolltoppp"><img src="../images/ad 1.png" alt="" style="height: 394px; width: 766px;"></RouterLink>
            <div class="text2">
    <h3>EXCLUSIVE MEN'S WEAR TOP <span style="">FASHION BRANDS</span></h3>
            </div>
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

.activeCategory{
    color: #e13ed7 !important;
    border-bottom: 2px solid #505050;
    padding-bottom: 0.2vh;
}
.title{
    font-family: 'Roboto', sans-serif;
    text-align: center;
    font-weight: 700;
}
.heading{
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 4vh;
}
hr{
    width: 30%;
    height: 0.6vh;
    background-color: black;
    margin: 0 2vh;
}
.categories{
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 3vh;
}
.links{
    text-decoration: none;
    margin: 0 2vh;
    color: #505050;
    transition-duration: 0.2s;
}
.links:hover{
    color: #e13ed7;
}
.advertisee{
    display: flex;
    justify-content: center;
    width: 97%;
    overflow-x: hidden;
    margin: 5vh auto;
}
.left , .right{
    position: relative;
    cursor: pointer;
}
.text{
    position: absolute;
    top: 50%;
    left: 50%;
    color: black;
    text-align: center;
    text-shadow: 2px 3px 13px white;

}
.text2{
    width: 60%;
    position: absolute;
    top: 50%;
    left: 22%;
    color: white;
    text-align: center;
    text-shadow: 2px 3px 13px black;
}
.text .off{
  /* Rotate from top left corner (not default) */
  transform: rotate(180deg);
}
.products{
    width: 85%;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    margin: 10vh auto;
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
.none{
    display: none !important;
}
</style>
<script>
import axios from "axios";
export default {
    data() {
        return {
            AllFeatured: [],
            MenCategory : [],
            WomenCategory : [],
            KidsCategory : [],
            productDetailss : [],
            token : '',
        }
    },
    computed : {
        authenticated(){
            this.token = this.$store.state.token
            return this.$store.state.authenticated
        }
    },
    methods : {
        scrolltoppp(){
            window.scrollTo(0, 60);
        },
        SwitchToMen(){
            let men = document.getElementById('men');
            let women = document.getElementById('women');
            let kids = document.getElementById('kids');
            let all = document.getElementById('all');
            let allLink = document.getElementById('allLink')
            let womenLink = document.getElementById('womenLink')
            let kidsLink = document.getElementById('kidsLink')
            let menLink = document.getElementById('menLink')
            men.classList.remove('none');
            women.classList.add('none');
            kids.classList.add('none');
            all.classList.add('none');
            allLink.classList.remove('activeCategory');
            womenLink.classList.remove('activeCategory');
            kidsLink.classList.remove('activeCategory');
            menLink.classList.add('activeCategory');
        },
        SwitchToAll(){
            let men = document.getElementById('men');
            let women = document.getElementById('women');
            let kids = document.getElementById('kids');
            let all = document.getElementById('all');
            let allLink = document.getElementById('allLink') 
            let womenLink = document.getElementById('womenLink')
            let kidsLink = document.getElementById('kidsLink')
            let menLink = document.getElementById('menLink')
            men.classList.add('none');
            women.classList.add('none');
            kids.classList.add('none');
            all.classList.remove('none');
            allLink.classList.add('activeCategory');
            menLink.classList.remove('activeCategory');
            kidsLink.classList.remove('activeCategory');
            womenLink.classList.remove('activeCategory');
        },
        SwitchToWomen(){
            let men = document.getElementById('men');
            let women = document.getElementById('women');
            let kids = document.getElementById('kids');
            let all = document.getElementById('all');
            let allLink = document.getElementById('allLink') 
            let womenLink = document.getElementById('womenLink')
            let kidsLink = document.getElementById('kidsLink')
            let menLink = document.getElementById('menLink')
            men.classList.add('none');
            women.classList.remove('none');
            kids.classList.add('none');
            all.classList.add('none');
            allLink.classList.remove('activeCategory');
            menLink.classList.remove('activeCategory');
            kidsLink.classList.remove('activeCategory');
            womenLink.classList.add('activeCategory');
        },
        SwitchToKids(){
            let men = document.getElementById('men');
            let women = document.getElementById('women');
            let kids = document.getElementById('kids');
            let all = document.getElementById('all');
            let allLink = document.getElementById('allLink') 
            let womenLink = document.getElementById('womenLink')
            let kidsLink = document.getElementById('kidsLink')
            let menLink = document.getElementById('menLink')
            men.classList.add('none');
            women.classList.add('none');
            kids.classList.remove('none');
            all.classList.add('none');
            allLink.classList.remove('activeCategory');
            menLink.classList.remove('activeCategory');
            kidsLink.classList.add('activeCategory');
            womenLink.classList.remove('activeCategory');
        },
        ProductDetails(id){
            window.scrollTo(0,0);
            axios.get('http://127.0.0.1:8000/api/proudcts/'+ id).then((response)=> {
                this.productDetailss = response.data.product;
                this.$store.state.productDetails = []
                this.$store.state.productDetails = this.productDetailss
                this.$store.state.path = 'Featured'
            }).catch(function(error) {
                console.log(error.response.data.message);
            });
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
        }
    },
    beforeMount() {
        axios.get("http://127.0.0.1:8000/api/Featured").then((response)=> {
                this.AllFeatured = response.data.products;
            })
        axios.get("http://127.0.0.1:8000/api/Men").then((response)=> {
                if(response.data.message){
                this.MenCategory = response.data;
                }
                else{
                this.MenCategory = response.data.products;
                }
            }).catch(function(error) {
                console.log(error.response.data.message);
            });
        axios.get("http://127.0.0.1:8000/api/Women").then((response)=> {
                if(response.data.message){
                this.WomenCategory = response.data;
                }
                else{
                this.WomenCategory = response.data.products;
                }
            }).catch(function(error) {
                console.log(error.response.data.message);
            });
        axios.get("http://127.0.0.1:8000/api/KIDS").then((response)=> {
            if(response.data.message){
                this.KidsCategory = response.data;
                }
                else{
                this.KidsCategory = response.data.products;
                }
            }).catch(function(error) {
                console.log(error.response.data.message);
            });

    },
}
</script>
