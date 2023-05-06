<template>
    <!-- *******LOADING******* -->
    <div class="bg" id="loading">
        <div class="ring">Loading
            <span class="loadingSpan"></span>
        </div>
    </div>
    <!-- *******LOADING-END******* -->
    <div class="dashboard">
        <div class="dashMenu">
            <h1 class="titlee" style="text-align: center;">Dashboard</h1>
            <hr style="height: 0.4vh; background-color: white; color: white; width: 90%; margin: 0 auto 2vh; box-shadow: 0px 0px 10px black;">
            <div class="linkss">
                <RouterLink to="/dashboard" class="sideMenuLinks">Add Products</RouterLink>
                <RouterLink to="/dashboard/Products" class="sideMenuLinks" style="margin-right: 22px;">Edit Products</RouterLink>
                <RouterLink to="/dashboard/addCategories" class="sideMenuLinks">Add Categories</RouterLink>
                <RouterLink to="/dashboard/UserRole" class="sideMenuLinks active">Edit User Role</RouterLink>
            </div>
            <hr id="downHr" style="height: 0.4vh; background-color: white; color: white; width: 70%; margin: 2vh auto; box-shadow: 0px 0px 10px black;">
        </div>
        <form @submit.prevent="submit">
            <div class="heading">
                <hr>
                <h3 class="title">Manage Users</h3>
                <hr>
            </div>
            <span class="d-none databaseError" id="databaseError"></span>
            <select v-model="FormData.email" id="selectCategory" value="Choose User">
                <option value="" class="optionn">Choose User</option>
                <option v-for="user in users" class="optionn" :value="user.email">{{ user.name }} -> {{ user.email }} -> {{ user.type }}</option>
            </select>
            <h4>or</h4>
            <label for="mail">Enter User Email Address</label>
            <input type="email" id="mail" v-model="FormData.email" placeholder="Enter the user Email address..">
            <hr style="width: 70%; margin: 3vh auto;">
            <select v-model="FormData.type" required id="selectCategory" value="Choose Role">
                <option value="" class="optionn">Choose Role</option>
                <option value="user" class="optionn">User</option>
                <option value="admin" class="optionn">Admin</option>
            </select>
            <input type="submit" value="Submit" class="submit">
            <span class="d-none databaseError" id="validationError">Please choose the user and his role</span>
            <span class="d-none p-3 text-white bg-success" id="success">User Role Updated Successfully</span>
        </form>
    </div>
</template>
<style scoped>
@import url('https://fonts.googleapis.com/css2?family=PT+Sans&display=swap');
.databaseError{
    padding: 1vh 2vh;
    background-color: red;
    color: white;
    width: 65%;
    margin: 2vh auto;
}
form{
    font-family: 'PT Sans', sans-serif;
    width: 50%;
    margin: 5vh auto;
    display: flex;
    flex-direction: column;
    justify-content: center;
    text-align: center;
}
select,input{
    margin: 2vh;
    padding: 2vh;
    text-align: center;
    background-color: #3c3c3c3b;
    border: none;
    border-bottom: 1px solid black;
}

option{
    height: 5vh;
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
.title{
    text-align: center;
    font-weight: 700;
}
.heading{
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 2vh 0;
}
hr{
    width: 30%;
    height: 0.6vh;
    background-color: black;
    margin: 0 2vh;
}
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
.active{
    background-color: rgba(124, 9, 232, 0.923) !important;
}
</style>
<script>
import axios from "axios";
export default {
    data() {
        return {
            users : [],
            authorized : false,
            FormData:{
                email : '',
                type : '',
            }
        }
    },
    beforeMount(){
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
    methods: {
        submit(){
            let databaseError = document.getElementById('databaseError')
            let validationError = document.getElementById('validationError')
            let success = document.getElementById('success')
            if(!this.FormData.email || !this.FormData.type){
                validationError.classList.remove('d-none')
            }
            else{
                axios.put("http://127.0.0.1:8000/api/Users/UpdateRole",this.FormData).then((response) => {
                    success.classList.remove('d-none')
                    setTimeout(() => {
                        location.reload();
                    }, 600);
                }).catch((error) =>{
                    databaseError.innerText = error.response.data.message
                    databaseError.classList.remove('d-none')
                  });
            }
        }
    },
    mounted() {
        setTimeout(() => {
            let loading = document.getElementById('loading')
            loading.classList.add('d-none')
            let token = this.$store.state.token
            if(this.authorized){
            axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
            axios.get("http://127.0.0.1:8000/api/Users").then((response) => {
                this.users = response.data.users
                console.log(this.users);
            }).catch((error) =>{
                if(error.response.data.message == 'unauthorized'){
                    this.$router.push('/')
                }
              });
        }
        }, 1400);


},
}
</script>