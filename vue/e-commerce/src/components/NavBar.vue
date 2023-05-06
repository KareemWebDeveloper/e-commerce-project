<template>
    <div v-on:scroll.passive='handleScroll(e)' style="z-index: 9; width: 100%;">
        <!-- ************* header ************** -->
        <div class="header fixed">
            <p> <i class="fa-solid fa-gift"></i> Free Shipping on All orders Over $75 <i class="fa-solid fa-gift"></i></p>
            <div class="headerLinks">
                <RouterLink class="router" v-if="authenticated && isAdmin" to="/dashboard">Dashboard</RouterLink>
                <RouterLink class="router" v-if="authenticated" to="/profile">My Account<i class="fa-solid fa-user mx-2"></i></RouterLink>
                <RouterLink class="router" v-if="!authenticated" to="/login">Login</RouterLink>
                <RouterLink class="router" to="">Currency : EGP</RouterLink>
                <RouterLink class="router1" to="/cart"><i class="fa-solid fa-cart-shopping"></i> My Craft</RouterLink>
                <RouterLink class="router" v-if="authenticated" to="/" @click="logout">Logout</RouterLink>
            </div>
        </div>
        <!-- ************* header end ************** -->

        <!-- *********** navbar search area ************ -->
        <div class="searchArea">
            <div class="search">
                <input type="text" class="searchBar" placeholder="Search Here What You Need...." v-model="search">
                
                <button @click="Search" class="searchButton"><i class="fa-solid fa-magnifying-glass kimo"></i></button>
            </div>
        </div>
        <!-- *********** navbar search end ************ -->

        <!-- *********** large screens navbar ************ -->
        <div class="navBar" id="navbar">
            <div class="logo">
                <div @click="showSideBar">
                    <i class="fa-solid fa-bars d-lg-none h5 mb-0" id="menuButton"></i>
                    <i class="fa-sharp fa-solid fa-square-xmark none" id="closee" style="font-size: 23px;"></i>
                </div>
                <h1>Fashion  
                        <div class="search-container d-none" id="searchNav">
                        <input type="text" name="search" placeholder="Search..." class="search-input" v-model="search">
                        <button  @click="Search" href="#" class="search-btn">
                        <i class="fas fa-search"></i>      
                        </button>
                    </div>
                </h1>
            </div>
            <div class="navLinks d-none d-lg-flex">
                <RouterLink class="NavLink" @click="closeNav"  to="/">Home</RouterLink>
                <RouterLink class="NavLink" @click="closeNav" to="/Women">Women</RouterLink>
                <RouterLink class="NavLink" @click="closeNav" to="/Men">Men</RouterLink>
                <RouterLink class="NavLink" @click="closeNav" to="/footwear">Footwear</RouterLink>
                <RouterLink class="NavLink" @click="closeNav" to="/accessories">Accessories</RouterLink>
                <RouterLink class="NavLink" @click="closeNav" to="/sales">Sales</RouterLink>
                <RouterLink class="NavLink" @click="closeNav" to="">Blog</RouterLink>
            </div>
        <!-- *********** large screens navbar end************ -->
        
        <!-- *********** small and medium screens navbar ************ -->
            <div class="navLinks smallNav">
                <RouterLink class="NavLink" to="/profile"><i class="fa-solid fa-user h5 mb-0"></i></RouterLink>
                <RouterLink class="NavLink" to="/cart"><i class="fa-solid fa-cart-shopping h5 mb-0"></i></RouterLink>
                <RouterLink class="NavLink" v-if="authenticated" to="/" @click="logout"><i class="fa-solid fa-right-from-bracket h5 mb-0"></i></RouterLink>
            </div>
        </div>
        <div class="sideMenu none" id="sideMenu">
            <RouterLink class="sideNavLink" @click="closeNav" to="/"><i class="fa-solid fa-house" style="margin: 0 0.4vh; font-size: 17px;"></i>Home</RouterLink>
            <hr>
            <RouterLink class="sideNavLink" @click="closeNav" to="/all">All Products</RouterLink>
            <hr>
            <RouterLink class="sideNavLink" @click="closeNav" to="/Women"><i class="fa-solid fa-person-dress" style="margin: 0 0.4vh; font-size: 19px;"></i>Women</RouterLink>
            <hr>
            <RouterLink class="sideNavLink" @click="closeNav" to="/Men"><i class="fa-solid fa-person" style="margin: 0 0.4vh; font-size: 19px;"></i>Men</RouterLink>
            <hr>
            <RouterLink class="sideNavLink" @click="closeNav" to="/footwear"><i class="fa-solid fa-shoe-prints" style="margin: 0 0.4vh; font-size: 18px;"></i>Footwear</RouterLink>
            <hr>
            <RouterLink class="sideNavLink" @click="closeNav" to="/accessories"><i class="fa-solid fa-glasses" style="margin: 0 0.6vh; font-size: 19px;"></i>Accessories</RouterLink>
            <hr>
            <RouterLink class="sideNavLink" @click="closeNav" to="/sales"><i class="fa-solid fa-tag" style="margin: 0 0.4vh; font-size: 19px;"></i>Sales</RouterLink>
            <hr>
            <RouterLink class="sideNavLink" @click="closeNav" to="">Blog</RouterLink>
            <hr>
            <p><i class="fa-solid fa-phone" style="margin-right: 1vh;"></i>CUSTOMER SERVICE : 19877</p>
        </div>
        <!-- *********** small and medium screens navbar end************ -->

    </div>
</template>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Mynerve&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Faster+One&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Kaushan+Script&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Lobster&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Caveat:wght@600;700&display=swap');
*{
    font-family: 'Roboto', sans-serif;
    font-size: 14px;
}
hr{
    width: 70%;
    height: 0.4vh;
    background-color: #e13ed7;
    margin: 1vh auto;
}
.none{
    display: none !important;
}
.sideMenu{
    display: none;
}
.fadeIn{
    opacity: 1;
    animation: fadeI 0.2s;
}
@keyframes fadeI {
    0%{
        opacity: 0;
    }
    100%{
        opacity: 1;
    }
}
.fadeOut{
    opacity: 0;
    animation: fadeO 0.2s;
}
@keyframes fadeO {
    0%{
        opacity: 1;
    }
    100%{
        opacity: 0;
    }
}
.header{
    display: flex;
    justify-content: space-between;
    padding: 2vh 2vh 0;
    background-color: #f3f3f3;
}
.header p{
    color: #868383;
    padding-left: 10vh;
}
.headerLinks{
    text-decoration: none;
    padding-right: 10vh;
}
.headerLinks .router{
    color: #868383;
    margin: 0 2vh;
    text-decoration: none;
    transition-duration: 0.2s;
}
.headerLinks .router:hover{
    color: black;
}
.headerLinks .router1{
    color: #e13ed7;
    margin: 0 2vh;
    text-decoration: none;
    transition-duration: 0.2s;
}
.headerLinks .router1:hover{
    color: #ff00eeeb;

}
.router1 i{
    margin-right: 1vh;
}
.searchButton,.search-btn{
    background-color: #ffffff00;
    border: none;
}
.navBar{
    z-index: 9;
    width: 100%;
    background-color: black;
    display: flex;
    justify-content: space-between;
    padding: 2vh 3vh;
    color: white;
    align-items: center;
}
.toggle{
    background-color: rgba(0, 0, 0, 0.688);
    animation: navbarToggle 0.3s;
}
@keyframes navbarToggle {
    0%{
        background-color: black;
    }
    100%{
        background-color: rgba(0, 0, 0, 0.688);
    }
}
.logo{
    display: flex;
    align-items: center;
}
.navBar h1{
    display: flex;
    align-items: center;
    color: rgb(255, 255, 255);
    /*font-family: 'Mynerve', cursive;*/
    /*font-family: 'Faster One', cursive;*/
    font-family: 'Kaushan Script', cursive;
    font-weight: bold;
    letter-spacing: 4px;
    font-size: 38px;
    padding-left: 10vh;
    text-shadow: 2px 2px 3px rgba(82, 65, 65, 0.5);
    -webkit-background-clip: text;
       -moz-background-clip: text;
            background-clip: text;
}
.searchArea{
    padding: 3vh 0;
    width: 100%;
    margin: auto;
}
.search{
    margin: auto;
    background-color: white;
    border-radius: 20px;
    width: 20%;
    height: 40px;
    display: flex;
    align-items: center;
    justify-content: center;
    border: 2px solid #868383;
    box-shadow:  4px 4px 6px rgba(255, 255, 255, 0.3),
    -4px -4px 6px 0 rgba(116, 125, 136, .2), 
}
.searchBar{
    background-color: white;
    width: 80%;
    height: 100%;
    border-radius: 20px;
    padding-left: 1vh;
    background: transparent;
    border: none;
    outline:none;
}
.search i{
    color: black;
}
.kimo{
    color: #868383 !important;
    font-size: 15px;
    padding-left: 1vh;
    cursor: pointer;
}
.NavLink{
    text-decoration: none;
    color: white;
    margin: 0 1.8vh;
    transition-duration: 0.2s;
}
.NavLink:hover{
    color: #e13ed7;
}
.navLinks{
    padding-right: 9vh;
}

.search-container{
    background: #fff;
    height: 30px;
    border-radius: 30px;
    padding: 10px 20px;
    margin-left: 2vh;
    display: flex;
    justify-content: center;
    align-items: center;
    cursor: pointer;
    transition: 0.8s;
    /*box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
    inset -7px -7px 10px 0px rgba(0,0,0,.1),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
   text-shadow:  0px 0px 6px rgba(255,255,255,.3),
              -4px -4px 6px rgba(116, 125, 136, .2);
  text-shadow: 2px 2px 3px rgba(255,255,255,0.5);*/
  box-shadow:  4px 4px 6px 0 rgba(255,255,255,.3),
              -4px -4px 6px 0 rgba(116, 125, 136, .2), 
    inset -4px -4px 6px 0 rgba(255,255,255,.2),
    inset 4px 4px 6px 0 rgba(0, 0, 0, .2);
}

.search-container:hover > .search-input{
    width: 400px;
}

.search-container .search-input{
    background: transparent;
    border: none;
    outline:none;
    width: 0px;
    font-weight: 500;
    font-size: 16px;
    transition: 0.8s;

}

.search-container .search-btn .fas{
    color: #5cbdbb;
    background-color: #f3f3f300;
    border: none;
}

@keyframes hoverShake {
  0% {transform: skew(0deg,0deg);}
  25% {transform: skew(5deg, 5deg);}
  75% {transform: skew(-5deg, -5deg);}
  100% {transform: skew(0deg,0deg);}
}

.search-container:hover{
  animation: hoverShake 0.15s linear 3;
}

@media screen and (min-width: 1100px) {
.smallNav{
    display: none;
}
}

@media screen and (max-width: 1100px) {
    .headerLinks{
        display: none;
    }
    .menuOpen{
        width: 100%;
        animation: open 0.3s;
    }
    .menuClose{
        width: 0%;
        animation: close 0.3s;
    }
    @keyframes open {
        0%{
            width: 0%;
        }
        100%{
            width: 100%;
        }
    }
    @keyframes close {
        0%{
            width: 100%;
        }
        100%{
            width: 0%;
        }
    }
    .sideMenu{
        padding: 1vh 0;
        position: absolute;
        width: 100%;
        height: 100%;
        display: flex;
        flex-direction: column;
        background-color: white;
        z-index: 9;
    }
    .sideNavLink{
        background-color: rgba(0, 0, 0, 0.738);
        color: white;
        text-decoration: none;
        padding: 1.5vh;
        margin: 1vh 2vh;
        text-align: center;
        border-radius: 5px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.59);
    font-family: 'Kaushan Script', cursive;
    text-shadow: 0px 0px 3px rgba(0, 0, 0, 0.822);
    }
    .sideMenu p{
        width: 100%;
        color: white;
        background-color: rgba(0, 0, 0, 0.855);
        text-align: center;
        padding: 2vh;
        margin-top: 2vh;
    }
    .header{
        width: 100%;
        max-width: 100%;
        margin-left: 0;
        margin-right: 0;
        padding: 0;
        padding: 1.2vh 0;
        justify-content: center;
    }
    .header p{
        color: black;
        margin-bottom: 0;
        text-align: center;
        padding-left: 0;
    }
    .searchArea{
        display: none;
    }
    .navBar{
        max-width: 100%;
    }
    .navBar h1{
        padding-left: 1vh;
        font-size: 24px;
        font-weight: 600;
        letter-spacing: 2px;
        margin-bottom: 0;
    }
    .navLinks{
        display: flex;
        align-items: center;
        padding-right: 0;
    }
    .NavLink{
        margin: 0 1vh;
    }
}
@media screen and (max-width: 480px) {
    .headerLinks{
        display: none;
    }
    .header{
        width: 100%;
        max-width: 100%;
        margin-left: 0;
        margin-right: 0;
        padding: 0;
        padding: 1.2vh 0;
    }
    .header p{
        color: black;
        margin-bottom: 0;
    }
    .searchArea{
        display: none;
    }
    .navBar{
        max-width: 100%;
    }
    .navBar h1{
        padding-left: 1vh;
        font-size: 24px;
        font-weight: 600;
        letter-spacing: 2px;
        margin-bottom: 0;
    }
    .navLinks{
        display: flex;
        align-items: center;
        padding-right: 0;
    }
    .NavLink{
        margin: 0 1vh;
    }
}
</style>
<script>
import axios from "axios";
import CryptoJS from 'crypto-js';
export default {
    data() {
        return {
            token : '',
            isAdmin : false,
            search : '',
        }
    },
    computed : {
        authenticated(){ //checks if the the user is authenticated
            this.token = this.$store.state.token
            return this.$store.state.authenticated
        }
    },
    methods : {
        handleScroll(){ // toggles navbar into fixed when scrolling 
        let navbarr = document.getElementById('navbar');
            if(window.pageYOffset>10){
                navbarr.classList.add('position-fixed')
            }
            else{
                navbarr.classList.remove('position-fixed')
            }
        },
        Search(){ // search query api 
            console.log(this.search);
            axios.get("http://127.0.0.1:8000/api/search",{
                params:{
                    query: this.search
                }
            }).then((response) => {
                this.$store.state.searchResults = response.data
                window.scrollTo(0,20)
                this.$router.push('/search/results')
          })
        },
        logout(){  // logout api
            axios.defaults.headers.common['Authorization'] = `Bearer ${this.token}`
            axios.post("http://127.0.0.1:8000/api/logout").then((response) => {
                localStorage.removeItem('userToken');
                location.reload();
          }).catch(function(error) {
            console.log(error.response.data.message);
          });
        },
        showSideBar(){ //show side navbar for the small and medium screens
            window.scrollTo(0, 0);
            let sideMenu = document.getElementById('sideMenu');
            let menuButton = document.getElementById('menuButton');
            let closee = document.getElementById('closee');
            setTimeout(() => {
                if(sideMenu.classList.contains('none')){
                    sideMenu.classList.remove('none')
                    sideMenu.classList.add('menuOpen')
                    setTimeout(() => {
                     sideMenu.classList.remove('menuOpen')
                    }, 305);
                }
                else{
                    sideMenu.classList.add('menuClose');
                    setTimeout(() => {
                        sideMenu.classList.add('none')
                        sideMenu.classList.remove('menuClose');
                    }, 210);
    
                }
            }, 60);
        },
        closeNav(){
            window.scrollTo(0,20)
            let sideMenu = document.getElementById('sideMenu');
            sideMenu.classList.add('menuClose');
                    setTimeout(() => {
                        sideMenu.classList.add('none')
                        sideMenu.classList.remove('menuClose');
                    }, 180);
        }
    },
    mounted(){ 
        // show the dashboard button if the user type is admin
        axios.defaults.headers.common['Authorization'] = `Bearer ${this.token}`
            axios.get("http://127.0.0.1:8000/api/is-admin").then((response) => {
                this.isAdmin = response.data.isAdmin
          })
        
       let navbarr = document.getElementById('navbar');
       let searchNav = document.getElementById('searchNav');
        window.document.onscroll = () => {

        if(window.pageYOffset>138){
                navbarr.classList.add('position-fixed')
                navbarr.classList.add('toggle')
                navbarr.style.top=0;
                searchNav.classList.add('d-lg-flex')
                searchNav.classList.add('fadeIn')
            }
            else{
                navbarr.classList.remove('position-fixed')
                navbarr.classList.remove('toggle')
                searchNav.classList.add('fadeOut')
                setTimeout(() => {
                    searchNav.classList.remove('d-lg-flex')
                    searchNav.classList.remove('fadeIn')
                    searchNav.classList.remove('fadeOut')
                }, 200);
            }
        }
}
}
</script>