<template>
    <!-- *******LOADING******* -->
    <div class="bg" id="loading">
        <div class="ring">Loading
            <span class="loadingSpan"></span>
        </div>
    </div>
    <!-- *******LOADING-END******* -->
    <div class="dashboard">
        <!-- *********** Dashboard menu start ************ -->
        <div class="dashMenu">
            <h1 class="titlee" style="text-align: center;">Dashboard</h1>
            <hr style="height: 0.4vh; background-color: white; color: white; width: 90%; margin: 0 auto 2vh; box-shadow: 0px 0px 10px black;">
            <div class="linkss">
                <RouterLink to="/dashboard" class="sideMenuLinks">Add Products</RouterLink>
                <RouterLink to="/dashboard/Products" class="sideMenuLinks active" style="margin-right: 22px;">Edit Products</RouterLink>
                <RouterLink to="/dashboard/addCategories" class="sideMenuLinks">Add Categories</RouterLink>
                <RouterLink to="/dashboard/UserRole" class="sideMenuLinks">Edit User Role</RouterLink>
            </div>
            <hr id="downHr" style="height: 0.4vh; background-color: white; color: white; width: 70%; margin: 2vh auto; box-shadow: 0px 0px 10px black;">
        </div>
        <!-- *********** Dashboard menu end ************ -->

        <!--*********** database products preview and editing forms ************ -->
        <div class="productsForms">
            <div class="card" v-for="(product,index) in products">
                    <div class="productImg">
                        <RouterLink to="" style="cursor: default;"><img :src="`http://127.0.0.1:8000/images/products/${product.image}`" :id="`productImg${index}`" class="prod" alt="" @click="ProductDetails(product.id)"></RouterLink>
                        <img src="" class="prod d-none" :id="`previewImg${index}`" alt="">
                        <h3><input type="text" required v-model="product.price"></h3>
                        <label for="img" class="insertImage appearOnHover" id="insertImg" @click="imgId = index"><i class="fa-solid fa-image mx-auto"></i> Change Image</label>
                        <input type="file" class="d-none" @change="handleUpload($event.target.files)" id="img">
                    </div>
                    <div class="productInfo">
                        <h5 class="text-white bg-danger p-2 my-3 d-none" :id="`imageError${index}`">Please enter a valid image file</h5>
                        <label for="title">Title</label>
                        <textarea id="Title" required v-model="product.title"></textarea>
                        <hr style="margin: 1vh auto; width: 80%; height: 0.4vh; background-color: black;">
                        <label for="title">description</label>
                        <textarea required v-model="product.description"></textarea>
                        <hr style="margin: 1vh auto; width: 80%; height: 0.4vh; background-color: black;">
                        <label for="count">Count</label>
                        <input type="number" id="count" required v-model="product.count">
                        <hr style="margin: 1vh auto; width: 80%; height: 0.4vh; background-color: black;">
                        <label for="selectCategory">Choose Category</label>
                        <select v-model="product.category_id" required id="selectCategory" value="Choose Category" class="mb-3">
                            <option value="" class="optionn">Choose Category</option>
                            <option v-for="category in Categories" class="optionn" :value="category.id">{{ category.name }}</option>
                        </select>
                        <h5 :id="`ValidationError${index}`" class="text-danger text-center d-none" style="margin-bottom: 10vh;">Please enter the empty fields</h5>
                        <h5 :id="`success${index}`" class="text-white bg-success p-2 text-center d-none" style="margin-bottom: 10vh;">Product Updated Successfuly <i class="fa-solid fa-check mx-1"></i></h5>
                    </div>
                    <button class="DeleteButton" @click="Delete(product.id)" style="margin-bottom: 11vh;">Delete <i class="fa-solid fa-trash"></i></button>
                    <button class="submitButton" @click="update(index)">Submit</button>
            </div> 
        </div>
    </div>
</template>
<style scoped>

.dashboard{
    display: flex;
    flex-direction: column;
    margin-top: 10vh;
    padding: 4vh;
font-family: 'Kaushan Script', cursive;
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
    padding: 1vh 3vh;
    text-align: center;
}
.sideMenuLinks:hover{
    background-color: rgba(137, 43, 226, 0.792);
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.708);
}
.productsForms{
    margin: auto;
    width: 70%;
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
}
.active{
    background-color: rgba(124, 9, 232, 0.923) !important;
}
.card{
    display: flex;
    flex-direction: column;
    justify-content: center;
    margin: 4vh 3vh;
    position: relative;
}
.submitButton{
    position: absolute;
    bottom: 0%;
    left: 50%;
    padding: 1vh 2vh;
    border: none;
    background-color: #3c3c3c;
    color: white;
    border-radius: 5px;
    transform:translate(-50%,-50%);
    transition-duration: 0.2s;
}
.DeleteButton{
    width: 50%;
    margin: auto;
    padding: 1vh 2vh;
    border: none;
    background-color: #3c3c3c;
    color: white;
    border-radius: 5px;
    transition-duration: 0.2s;
}
.DeleteButton:hover{
    background-color: #191919;
    color: white;
}
.submitButton:hover{
    background-color: #191919;
    color: white;
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
    padding: 1vh;
    color: white;
    font-size: 15px;
}
.productImg h3 input{
    width: 10vh;
    text-align: center;
    padding: 1.2vh 0;
    background-color: rgba(255, 255, 255, 0.584);
}
.appearOnHover{
    font-size: 18px;
    text-align: center;
    color: white;
    background-color: rgba(0, 0, 0, 0.649);
    padding: 1vh;
    position: absolute;
    top: 50%;
    left: 50%;
    transform:translate(-50%,-50%);
    opacity: 0;
    cursor: pointer;
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
.productInfo textarea,input,select{
    font-family: 'PT Sans', sans-serif;
    width: 265px;
    font-size: 16px;
    text-align: center;
    margin: auto;
    padding: 0.4vh;
    border-radius: 3px;
}
h5{
    font-family: 'PT Sans', sans-serif;
}
label{
    margin: 0.8vh auto;
    font-family: 'PT Sans', sans-serif;
}
.productInfo p{
    font-size: 17px;
    font-family: 'PT Sans', sans-serif;
    width: 260px;
    margin: 1vh 0 9vh;
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
</style>
<script>
import axios from 'axios'
export default {
    data() {
        return {
            products : [],
            Categories : [],
            imgId : '',
            FormData:{
                id : '',
                title : '',
                image : '',
                count : '',
                price : '',
                category_id : '',
                description : '',
            }
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
            else{
                this.authorized = true;
            }
        })
    },
    mounted() {
        // products api that gets all the products from database table and viewing them
        axios.get("http://127.0.0.1:8000/api/allProudcts").then((response)=> {
                this.products = response.data.products;
        }).catch(function(error) {
                console.log(error.response.data.message);
            });
        axios.get("http://127.0.0.1:8000/api/category").then((response)=> {
            this.Categories = response.data.Categories;
        })
        setTimeout(() => {
            let loading = document.getElementById('loading')
            loading.classList.add('d-none')
        }, 1600);
    },
    methods: {
        Delete(id){ // delete a product
            axios.delete("http://127.0.0.1:8000/api/proudcts/remove/"+ id ).then((response)=> {
                location.reload();
        })
        },
        handleUpload(files){ // handles uploading an image file to update product image
            const reader = new FileReader();
            let file = files[0];
            reader.onload = () => {
                const result = reader.result;
                let imageError = document.getElementById(`imageError${this.imgId}`);
                if(result.startsWith('data:image/')){
                    this.products[this.imgId].image = files[0];
                    let productImg = document.getElementById(`productImg${this.imgId}`);
                    let previewImg = document.getElementById(`previewImg${this.imgId}`);
                    productImg.classList.add('d-none')
                    previewImg.classList.remove('d-none')
                    previewImg.src = URL.createObjectURL(files[0]);
                    imageError.classList.add('d-none')
                }
                else{
                    imageError.classList.remove('d-none')
                }
            }
            reader.readAsDataURL(file);
        },
        update(index){ // update product info
            let error1 = document.getElementById(`ValidationError${index}`)
            let successMsg = document.getElementById(`success${index}`)
            if(!this.products[index].title || !this.products[index].price || !this.products[index].count || !this.products[index].description || !this.products[index].category_id){
                error1.classList.remove('d-none')
            }
            else{
                this.FormData.id = this.products[index].id
                this.FormData.category_id = this.products[index].category_id
                this.FormData.description = this.products[index].description
                this.FormData.title = this.products[index].title
                this.FormData.price = this.products[index].price
                this.FormData.count = this.products[index].count
                this.FormData.image = this.products[index].image
                error1.classList.add('d-none')
                let token = this.$store.state.token
                axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
                axios.post("http://127.0.0.1:8000/api/proudcts/update",this.FormData,{
                headers: {
                    "Content-Type": "multipart/form-data",
                }, 
                }).then((response)=> {
                    successMsg.classList.remove('d-none')
                    setTimeout(() => {
                        location.reload();
                    }, 500);
                }).catch((error) =>{
                    error1.classList.remove('d-none')
                    error1.innerHTML = error.response.data.message
                    });
            }
        }
    },
}
</script>