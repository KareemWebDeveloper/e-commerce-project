<template>
    <footer>
      <div class="Upp">
        <div class="shops">
            <h4>SHOPS</h4>
            <RouterLink to="" class="links">New In</RouterLink>
            <RouterLink to="" class="links">Women</RouterLink>
            <RouterLink to="" class="links">Men</RouterLink>
            <RouterLink to="" class="links">Schuhe Shoes</RouterLink>
            <RouterLink to="" class="links">Bags & Accessories</RouterLink>
            <RouterLink to="" class="links">Top Brands</RouterLink>
            <RouterLink to="" class="links">Sale & Special Offers</RouterLink>
            <RouterLink to="" class="links">Lookbook</RouterLink>
        </div> 
        <div class="shops">
            <h4>INFORMATION</h4>
            <RouterLink to="" class="links">About Us</RouterLink>
            <RouterLink to="" class="links">Customer Service</RouterLink>
            <RouterLink to="" class="links">New Collection</RouterLink>
            <RouterLink to="" class="links">Best Sellers</RouterLink>
            <RouterLink to="" class="links">Manufacturers</RouterLink>
            <RouterLink to="" class="links">privacy policy</RouterLink>
            <RouterLink to="" class="links">Terms & condition</RouterLink>
            <RouterLink to="" class="links">Blog</RouterLink>
        </div> 
        <div class="shops">
            <h4>CUSTOMER SERVICE</h4>
            <RouterLink to="" class="links">Search Terms</RouterLink>
            <RouterLink to="" class="links">Advanced Search</RouterLink>
            <RouterLink to="" class="links">Order and Returns</RouterLink>
            <RouterLink to="" class="links">Contact Us</RouterLink>
            <RouterLink to="" class="links">RSS</RouterLink>
            <RouterLink to="" class="links">Help & FAQs</RouterLink>
            <RouterLink to="" class="links">Consultant</RouterLink>
            <RouterLink to="" class="links">Store Locations</RouterLink>
        </div> 
        <div class="newsletter">
            <h4>NEWSLETTER</h4>
            <form >
                <label for="signUp">Sign Up for News Letter</label>
                <input type="email" placeholder="Type Your E-mail" id="signUp" name="newsLetterMail">
                <input type="submit" value="SUBSCRIBE" class="subscribe">
            </form>
            <div class="icons">
                <i class="fa-brands fa-facebook icc" style="margin: 0 0.7vh;"></i>
                <i class="fa-brands fa-twitter icc" style="margin: 0 0.7vh;"></i>
                <i class="fa-brands fa-tiktok icc" style="margin: 0 0.7vh;"></i>
                <i class="fa-brands fa-youtube icc" style="margin: 0 0.7vh;"></i>
            </div>
        </div> 
    </div>
       <div class="outro">
        <p> 	&#169; 2023 Fashion Store Shopify. All Rights Reserved. Ecommerce Software by Kareem Ayman.
        </p>
        <div class="icons2">
            <i class="fa-brands fa-cc-visa icc" style="margin: 0 0.7vh;"></i>
            <i class="fa-brands fa-cc-mastercard icc" style="margin: 0 0.7vh;"></i>
            <i class="fa-brands fa-cc-paypal icc" style="margin: 0 0.7vh;"></i>
        </div>
       </div>
    </footer>
</template>
<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');
footer{
    background-color: #1d1d1d;
    font-family: 'Roboto', sans-serif;
}
.Upp{
    padding: 15vh;
    display: flex;
    width: 100%;
}
.shops{
    display: flex;
    flex-direction: column;
    margin-right: 3vh;
    width: 25%;
}
.shops h4 , .newsletter h4{
    color: white;
    font-weight: 600;
    margin-bottom: 3vh;
}
.links{
    width: 50%;
    color: #a8a8a8;
    text-decoration: none;
    margin: 0.2vh 0;
    transition-duration: 0.2s;
}
.links:hover{
    color: white;
}
.newsletter form{
    display: flex;
    flex-direction: column;
}
.newsletter label{
    color: #a8a8a8;
    margin: 1vh 0;
}
.newsletter input{
    background-color: #a8a8a800;
    border: 1px solid white;
    margin: 1vh 0;
    padding: 0.3vh 2vh;
    color: white;
}
.subscribe{
    background-color: #e13ed7 !important;
    border: none !important;
    font-weight: 600;
    padding: 0.6vh 2vh !important;
    margin-top: 1vh;
}
.icons{
    display: flex;
    justify-content: center;
    color: #a8a8a8;
    font-size: 26px;
    margin-top: 2vh;
}
.icc{
    color: #a8a8a8;
    cursor: pointer;
    transition-duration: 0.2s;
}
.icc:hover{
    color: white;
}
.outro{
    padding: 1.5vh 0vh;
    background-color: black;
    display: flex;
    justify-content: space-between;
    align-items: center;
}
.outro p{
    font-size: 13px;
    margin-bottom: 0;
    color: #a8a8a8;
    padding-left: 10vh;
}
.icons2{
    padding-right: 10vh;
    color: #a8a8a8;
    font-size: 24px;
}
@media screen and (max-width:1200px){
    *{
        margin: 0;
    }
    .Upp{
        padding: 0;
        display: flex;
        /*flex-direction: column;*/
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
        padding: 3vh;
    }
    .shops{
        width: 25%;
        text-align: center;
        margin: auto;
        
    }
    .newsletter{
        width: 25%;
        margin: auto;
    }
    .shops h4 , .newsletter h4{
        color: white;
        font-weight: 600;
        margin: 2vh;
        text-align: center;
    }
    .links{
        width: 100%;
        text-align: center;
        margin: auto;
    }
    .newsletter label{
        color: #a8a8a8;
        margin: auto;
    }
    .newsletter h4{
        margin-top: 4vh;
    }
    .newsletter input{
        width: 70%;
        margin: 1vh auto;
        padding: 1vh 2vh;
        color: white;
    }
    .outro{
        display: flex;
        flex-direction: column;
        padding: 1.8vh 0;
    }
    .outro p{
        width: 90%;
        padding: 0vh;
        text-align: center;
        margin-bottom: 1vh;
    }
    .icons2{
        display: flex;
        justify-content: center;
        font-size: 24px;
        padding-right: 0;
        margin: auto;
    }
}
@media screen and (max-width:800px){
    *{
        margin: 0;
    }
    .Upp{
        padding: 0;
        display: flex;
        /*flex-direction: column;*/
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
        padding: 3vh;
    }
    .shops{
        width: 50%;
        text-align: center;
        margin: auto;
        
    }
    .newsletter{
        width: 50%;
        margin: auto;
    }
    .shops h4 , .newsletter h4{
        color: white;
        font-weight: 600;
        margin: 2vh;
        text-align: center;
    }
    .links{
        width: 100%;
        text-align: center;
        margin: auto;
    }
    .newsletter label{
        color: #a8a8a8;
        margin: auto;
    }
    .newsletter h4{
        margin-top: 4vh;
    }
    .newsletter input{
        width: 70%;
        margin: 1vh auto;
        padding: 1vh 2vh;
        color: white;
    }
    .outro{
        display: flex;
        flex-direction: column;
        padding: 1.8vh 0;
    }
    .outro p{
        width: 90%;
        padding: 0vh;
        text-align: center;
        margin-bottom: 1vh;
    }
    .icons2{
        display: flex;
        justify-content: center;
        font-size: 24px;
        padding-right: 0;
        margin: auto;
    }
}

@media screen and (max-width:700px){
    *{
        margin: 0;
    }
    .Upp{
        padding: 0;
        display: flex;
        flex-direction: column;
        justify-content: center;
        padding: 3vh;
    }
    .shops{
        width: 90%;
        text-align: center;
        margin: auto;
    }
    .shops h4 , .newsletter h4{
        color: white;
        font-weight: 600;
        margin: 2vh;
        text-align: center;
    }
    .links{
        width: 100%;
        text-align: center;
        margin: auto;
    }
    .newsletter label{
        color: #a8a8a8;
        margin: auto;
        text-align: center;
    }
    .newsletter h4{
        margin-top: 4vh;
    }
    .newsletter input{
        width: 85%;
        margin: 1vh auto;
        padding: 1vh 2vh;
        color: white;
        font-size: 13px;
        text-align: center;
    }
    .outro{
        display: flex;
        flex-direction: column;
        padding: 1.8vh 0;
    }
    .outro p{
        width: 90%;
        padding: 0vh;
        text-align: center;
        margin-bottom: 1vh;
    }
    .newsletter{
        margin: auto;
    }
    .icons2{
        display: flex;
        justify-content: center;
        font-size: 24px;
        padding-right: 0;
        margin: auto;
    }
}
</style>