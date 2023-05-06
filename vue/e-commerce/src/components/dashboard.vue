<template>
    <!-- *******LOADING******* -->
    <div class="bg" id="loading">
        <div class="ring">Loading
            <span class="loadingSpan"></span>
        </div>
    </div>
    <!-- *******LOADING-END******* -->

    <div class="dashboard">

        <!-- *********************** dashboard menu ************************* -->
        <div class="dashMenu">
            <h1 class="titlee" style="text-align: center;">Dashboard</h1>
            <hr style="height: 0.4vh; background-color: white; color: white; width: 90%; margin: 0 auto 2vh; box-shadow: 0px 0px 10px black;">
            <div class="linkss">
                <RouterLink to="/dashboard" class="sideMenuLinks active">Add Products</RouterLink>
                <RouterLink to="/dashboard/Products" class="sideMenuLinks" style="margin-right: 22px;">Edit Products</RouterLink>
                <RouterLink to="/dashboard/addCategories" class="sideMenuLinks">Add Categories</RouterLink>
                <RouterLink to="/dashboard/UserRole" class="sideMenuLinks">Edit User Role</RouterLink>
            </div>
            <hr id="downHr" style="height: 0.4vh; background-color: white; color: white; width: 70%; margin: 2vh auto; box-shadow: 0px 0px 10px black;">
        </div>
        <ul class="d-none m-auto" id="ullistt">
            <div>
                <li><RouterLink to="" class="sideMenuLinksLi">Men</RouterLink></li>
                <li><RouterLink to="" class="sideMenuLinksLi">Women</RouterLink></li>
                <li><RouterLink to="" class="sideMenuLinksLi">Footwear</RouterLink></li>
                <li><RouterLink to="" class="sideMenuLinksLi">Accessories</RouterLink></li>
                <li><RouterLink to="" class="sideMenuLinksLi">Sales</RouterLink></li>
            </div>
        </ul>
        <!-- *********************** dashboard menu end************************* -->

        <div class="addProducts">
            <div class="heading">
                <hr>
                <h3 class="title">Add Products</h3>
                <hr>
            </div>

        <!-- *********************** dashboard add products form************************* -->

            <div class="formAndPreview">
                <form @submit.prevent="submitForm" enctype="multipart/form-data">
                    <label for="title">Product Title</label>
                    <input type="text" name="name" required id="title" v-model="FormData.title" placeholder="please enter product title here">
                    <label for="img" class="insertImage" id="insertImg"><i class="fa-solid fa-image mx-auto"></i> Product Image</label>
                    <input type="file" class="d-none" name="image" @change="handleUpload($event.target.files)" id="img">
                    <span id="imgError" class="text-center text-danger d-none mb-4">Please Upload an image</span>
                    <label for="description">Product Description</label>
                    <input type="text" required name="description" id="description" placeholder="please enter product description here" v-model="FormData.description">
                    <label for="price">Product Price</label>
                    <input type="text" required name="price" id="price" v-model="FormData.price" placeholder="please enter product price here">
                    <span id="PriceError" class="text-center text-danger d-none mb-4">Please Enter a Valid Price</span>
                    <label for="count">Product Count</label>
                    <input type="number" required name="count" id="count" placeholder="please enter product count here" v-model="FormData.count">
                    <input type="hidden" value="1" name="user_id" id="user_id">
                    <select v-model="FormData.category_id" required id="selectCategory" value="Choose Category">
                        <option value="" class="optionn">Choose Category</option>
                        <option v-for="category in Categories" class="optionn" :value="category.id">{{ category.name }}</option>
                    </select>
                    <input type="submit" value="submit" class="SubmitButton">
                </form>
        <!-- *********************** dashboard add products form end************************* -->

        <!-- *********************** product preview ************************* -->

                <div class="card d-none" id="ProductPreview">
                    <h2 class="text-center p-1">Preview</h2>
                    <div class="productImg">
                        <img src="" class="prod" alt="" id="previewImg">
                        <h3>{{ FormData.price }}</h3>
                        <i class="fa-solid fa-eye appearOnHover hovv"></i>
                    </div>
                    <div class="productInfo">
                        <h1>{{ FormData.title }}</h1>
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
                            <i class="fa-solid fa-cart-shopping prodIcons"></i> 
                            <i class="fa-solid fa-share prodIcons"></i>
                        </div>
                    </div>
                    <div class="done d-none" id="doneMsg">
                        <h3>Product Added Successfuly <i class="fa-solid fa-check mx-1"></i></h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Kaushan+Script&display=swap');
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
    .dashboard{
        display: flex;
        flex-direction: column;
        margin-top: 10vh;
        padding: 4vh;
    font-family: 'Kaushan Script', cursive;
    }
    .done{
        background-color: rgb(9, 176, 9);
        padding: 1.5vh;
        border-radius: 6px;
    }
    .done h3{
        font-size: 19px;
        text-align: center;
        color: white;
        padding: 0;
        margin: 0;
    }
    .titlee{
        color: white;
        text-shadow: 0px 0px 4px black;
    }
    .linkss{
        display: flex;
    }
    .dashMenu{
        display: flex;
        flex-direction: column;
        background-color: rgba(137, 43, 226, 0.781);
        padding: 3vh 5vh;
        padding-bottom: 0;
        border-radius: 3px;
        width: 50%;
        margin: auto;
    }
    .verticalLine{
        height: 90%;
        width: 0.2vh;
        background-color: black;
        margin: 0 1.5vh ;
    }
    .sideMenuLinks{
        text-decoration: none;
        color: white;
        font-size: 20px;
        background-color: rgba(137, 43, 226, 0.781);
        padding: 1vh 3vh;
        margin: 1vh auto;
        border-radius: 5px;
        transition-duration: 0.2s;
    }
    .sideMenuLinksLi{
        text-decoration: none;
        color: black;
        font-size: 15px;
        margin: 1vh auto;
        border-radius: 5px;
        width: 17vh;
        transition-duration: 0.2s;
        padding: 1vh 2vh;
        text-align: center;
    }
    .sideMenuLinks:hover{
        background-color: rgba(137, 43, 226, 0.792);
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.708);
    }
    .active{
        background-color: rgba(124, 9, 232, 0.923) !important;
    }
    ul{
        display: flex;
        margin: 1.5vh;
        padding-left: 0;
        background-color: rgba(137, 43, 226, 0.586);
        text-align: center;
        padding: 1.8vh 2vh 1.8vh 1.8vh;
    }
    .sideMenuLinksLi:hover{
        background-color: rgba(137, 43, 226, 0.586);
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.708);
    }
    .sideMenuLinks:hover ul{
        display: flex !important;
    }
    li{
        list-style: none;
        margin-bottom: 3vh;
        margin-left: 0;
        font-size: 17px !important;
        width: 17vh;
    }
    .addProducts{
        padding: 5vh;
        width: 100%;
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
        margin: 4vh 0;
    }
    hr{
        width: 30%;
        height: 0.6vh;
        background-color: black;
        margin: 0 2vh;
    }
    .formAndPreview{
        display: flex;
        justify-content: center;
    }
    .card{
        display: flex;
        flex-direction: column;
        justify-content: center;
        margin: 2vh;
    }
    .productImg{
        position: relative;
        margin-bottom: 2vh;
    }
    .prod{
        width: 272px;
        height: 406px;
        opacity: 1;
        transition-duration: 0.3s;
    }
    .verticalLine{
        height: 80%;
        width: 0.3vh;
        background-color: #575252;
        margin: 2vh;
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
        font-size: 26px;
        width: 272px;
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
    form{
        display: flex;
        flex-direction: column;
        justify-content: center;
        font-family: 'Roboto', sans-serif;
        width: 65%;
    }
    .insertImage{
        margin: 2vh auto 3vh;
        background-color: #d6d6d6;
        padding: 2vh 3vh;
        border-radius: 5px;
        cursor: pointer;
        transition-duration: 0.2s;
    }
    .insertImage:hover{
        background-color: #b5b4b4;
    }
    input,select{
        margin: 2vh auto;
        width: 75%;
        height: 7.5vh;
        border: none;
        border-bottom: 1px solid black ;
        border-radius: 8px;
        background-color: #e6e3e3;
        text-align: center;
        font-size: 15px;
    }
    .optionn{
        margin: 2vh;
        padding: 2vh;
    }
    label{
        text-align: center;
    }
    .SubmitButton{
        width: 20%;
        box-shadow: -1px 2px 7px black;
        margin-top: 5vh;
        transition-duration: 0.2s;
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
    .SubmitButton:hover{
        box-shadow: -1px 2px 12px black;
        background-color: #d1cfcf;
    }
    
</style>
<script>
import axios from "axios";
export default {
    data() {
        return {
            FormData: {
                title: '',
                image: '',
                description: '',
                price: '',
                count: '',
                category_id: '',
            },
            Categories: [],
            authorized: null,
        }
    },
    beforeMount(){
        //checks if the user is not admin return to the home page
        let token = this.$store.state.token
        axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
        axios.get("http://127.0.0.1:8000/api/is-admin").then((response) => {
            let authorized = response.data.isAdmin
            if(authorized==false){
                this.$router.push('/')
            }
    })
},
    methods: {
        handleUpload(files){  // handles uplaoding an image file and preview the product
            this.FormData.image = files[0];
            console.log(this.FormData.image);
            let previewImg = document.getElementById('previewImg');
            let insertImg = document.getElementById('insertImg');
            let span = document.getElementById('imgError');
            let ProductPreview = document.getElementById('ProductPreview');
            previewImg.src = files[0];
            previewImg.src = URL.createObjectURL(files[0]);
            setTimeout(() => {
                ProductPreview.classList.remove('d-none')
                insertImg.innerHTML=`<i class="fa-solid fa-image mx-2"></i>Change Image`
            }, 150);
            if(this.FormData.image){
                if(!span.classList.contains('d-none')){
                span.classList.add('d-none')}
            }
            
        },
        submitForm(){  // store product 
            let title = document.getElementById('title').value;
            let span = document.getElementById('imgError');
            let span2 = document.getElementById('PriceError');
            // let img = document.getElementById('img').value;
            let description = document.getElementById('description').value;
            let price = document.getElementById('price').value;
            let count = document.getElementById('count').value;
            if(!this.FormData.image){
                span.classList.remove('d-none')
            }
            else if(!(/^(\d{1,4})?(,?\d{3})*(\.\d{2})?$/.test(this.FormData.price))){
                span2.classList.remove('d-none')
            }
            else{
            let token = this.$store.state.token
            axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
            let res = axios.post("http://127.0.0.1:8000/api/proudctss",this.FormData,{
      headers: {
        "Content-Type": "multipart/form-data",
      }, 
    }).then((response) => {
                // this.data = result.products;
                console.log(response.data);
                let doneMsg = document.getElementById('doneMsg')
                doneMsg.classList.toggle('d-none')
                doneMsg.classList.toggle('fadeIn')
                let span2 = document.getElementById('PriceError');
                span2.classList.add('d-none')
                window.scrollTo(0,520)
                setTimeout(() => {
                    location.reload();
                }, 1200);
            }).catch(function(error) {
                console.log(error.response.data.message);
            });
         } 
        },
    },
    mounted() {
        axios.get("http://127.0.0.1:8000/api/category").then((response)=> {
                this.Categories = response.data.Categories;
                console.log(this.Categories);
            })
        setTimeout(() => {
            let loading = document.getElementById('loading')
            loading.classList.add('d-none')
        }, 1600);
    },
}
</script>