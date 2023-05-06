<template>
        <!-- *******LOADING******* -->
        <div class="bg" id="loading">
            <div class="ring">Loading
                <span class="loadingSpan"></span>
            </div>
        </div>
        <!-- *******LOADING-END******* -->
    <div class="profile">
        <form @submit.prevent="update" id="profileForm">
            <h2>Welcome {{ FormData.name.split(" ")[0].toUpperCase() }} , to your fashion profile</h2>
            <div class="d-flex justify-content-center my-3">
                <RouterLink to="/cart" class="links">Go To Your Cart <i class="fa-solid fa-cart-shopping"></i></RouterLink>
                <RouterLink to="/all" class="links">Continue Shopping <i class="fa-solid fa-basket-shopping mx-1"></i></RouterLink>
            </div>
            <hr style="width: 65%; margin: 1vh auto 2vh; height: 0.4vh; background-color: black;">
            <span class="databaseError d-none" id="databaseError"></span>
            <div class="d-flex w-100 justify-content-center">
                <div class="inputSection">
                    <label for="NAME">FULL NAME <i class="fa-solid fa-user"></i></label>
                    <input type="text" name="name" v-model="FormData.name" id="NAME" placeholder="Enter your full name ..">
                </div>
                <div class="inputSection">
                    <label for="mail">EMAIL ADDRESS <i class="fa-solid fa-envelope"></i></label>
                    <input type="email" name="email" id="mail" v-model="FormData.email" placeholder="Enter your email address ..">
                    <span class="d-none" id="MailError">Please enter a valid email</span>
                </div>
            </div>
            <div class="inputSection justify-content-center m-auto mt-3" style="width: 90%;">
                <label for="Address">ADDRESS <i class="fa-solid fa-address-book"></i></label>
                <textarea name="Address" id="Address" v-model="FormData.address"></textarea>
            </div>
            <div class="d-flex justify-content-center m-auto" style="width: 85%;">
                <div class="inputSection">
                    <label for="post">PostCode <i class="fa-solid fa-signs-post"></i></label>
                    <input type="text" name="PostCode" id="post" v-model="FormData.postCode" placeholder="Enter your PostCode ..">
                </div>
                <div class="inputSection">
                    <label for="City">City <i class="fa-solid fa-city"></i></label>
                    <input type="text" name="city" id="City" v-model="FormData.city" placeholder="Enter your City ..">
                </div>
            </div>
            <div class="d-flex justify-content-center m-auto" style="width: 85%;">
                <div class="inputSection">
                    <label for="phone">Phone Number <i class="fa-solid fa-phone"></i></label>
                    <input type="text" name="phone" id="phone" v-model="FormData.phone" placeholder="Enter your Phone Number ..">
                    <span class="d-none" id="phoneError">Please enter a valid phone number</span>
                </div>
                <div class="inputSection">
                    <label for="age">Age <i class="fa-solid fa-id-card"></i></label>
                    <input type="number" name="age" id="age" v-model="FormData.age" placeholder="Enter your age ..">
                </div>
            </div>
            <input type="submit" class="submit" value="Save Changes">
            <span class="d-none" id="error"><i class="fa-solid fa-exclamation errorIcon"></i> Please enter the empty field</span>
            <span class="d-none text-white bg-success p-3 w-50 m-auto my-3" id="success">Changes Has Been Successfully Saved <i class="fa-solid fa-check mx-1"></i></span>
            <h6 to="" class="logout my-3" @click="ResetPw">Reset Password</h6>
            <h6 class="logout" @click="logout">Logout</h6>
        </form>      
        <div class="resetPw d-none" id="resetPw">
            <label for="pw" class="tex-center m-auto">Enter your last password <i class="fa-solid fa-key"></i></label>
            <input type="password" required id="pw" placeholder="Enter your current password .." v-model="FormData.password">
            <span class="databaseError d-none text-center" id="databaseError2">Incorrect Password</span>
            <button class="submit w-50 m-auto my-3 p-3" @click="checkPw">Submit</button>
        </div>
        <div class="resetPw" v-if="this.resetPw" id="newPw">
            <label for="pw" class="tex-center m-auto">Enter a new password <i class="fa-solid fa-key"></i></label>
            <input type="password" required id="pw" placeholder="Enter your new password .." v-model="FormData.password">
            <span class="d-none databaseError" id="PasswordError">Please enter a password of min 8 characters which at least contains one digit</span>
            <span class="d-none text-white bg-success p-3 w-50 m-auto my-3" id="successPw">Password Has Been Successfully changed <i class="fa-solid fa-check mx-1"></i></span>
            <button class="submit w-50 m-auto my-3 p-3" @click="newPassword">Submit</button>
        </div>

    </div>
</template>
<style scoped>
  @import url('https://fonts.googleapis.com/css2?family=Secular+One&display=swap');
  .resetPw{
    padding: 10vh 0;
    width: 50%;
    margin: auto;
    display: flex;
    flex-direction: column;
    justify-content: center;
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
    .profile{
        background: #1a1b20 url(../images/wallpaper.jpg) fixed;
        background-size: cover;
        font-family: 'Secular One', sans-serif;
        padding: 20vh 0;
    }
    .logout{
        width: 20%;
        margin: auto;
        border: none;
        padding: 2vh;
        border-radius: 4px;
        background-color: rgba(255, 255, 255, 0.67);
        cursor: pointer;
        transition-duration: 0.2s;
    }
    .logout:hover{
        background-color: rgba(255, 255, 255, 0.47);

    }
    .links{
        text-decoration: none;
        background-color: #1a1b20;
        padding: 1.5vh 2.5vh;
        margin: 0 2vh;
        width: 28%;
        border-radius: 10px;
        transition-duration: 0.2s;
        color: white;
    }
    .links:hover{
        background-color: #1a1b20d8;
        color: #0d6efd;
    }
    form h2{
        text-shadow: 0px 0px 4px black;
        color: rgba(255, 255, 255, 0.808);
        border-bottom: 2px solid black;
        width: 75%;
        font-size: 27px;
        text-align: center;
        margin: 2vh auto 4vh;
        padding: 1vh;
    
    }
    .authenticated{
        margin: auto;
        text-align: center;
        width: 70%;
    }
    .authenticated img{
        width: 35%;
        border-bottom: 2px solid black;
    }
    .authenticated h1{
        color: white;
        margin: 2vh auto;
    }
    .authenticated .home{
        font-size: 20px;
        text-decoration: none;
    }
    .databaseError{
        padding: 1vh 2vh;
        background-color: red;
        color: white;
        width: 65%;
        margin: 2vh auto;
    }
    form{
        width: 55%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        padding: 5vh 3vh 8vh;
        border-radius: 20px;
        background-color: rgba(240, 248, 255, 0.274);
        text-align: center;
        margin: auto;
    }
    form img{
        width: 40%;
        margin: 0vh auto 3vh;
        border-bottom: 2px solid black;
    }
    input,textarea{
        width: 65%;
        height: 8vh;
        margin: 2vh auto;
        text-align: center;
        padding: 1.8vh;
        border: none;
        border-bottom: 2px solid black;
        border-radius: 20px;
        background-color: rgba(255, 255, 255, 0.504);
    }
    label{
        font-size: 17px;
        color: rgba(216, 216, 216, 0.936);
        text-shadow: 0px 0px 4px black;
    }
    .inputSection{
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        width: 70%;
    }
    .inputSection input{
        width: 85%;
    }
    .inputSection textarea{
        width: 100%;
    }
    .header{
        margin-bottom: 5vh !important;
    }
    .registerLink{
        text-decoration: none;
        color: black;
        transition-duration: 0.2s;
    }
    .submit{
        background-color: black;
        color: white;
        font-size: 17px;
        border: none;
        padding: 1vh;
        border-radius: 20px;
        transition-duration: 0.2s;
    }
    .submit:hover{
        background-color: rgba(0, 0, 0, 0.812);
    }
    .registerLink:hover{
        color: blue;
    }
    .error{
        border: none;
        border: 2px solid red !important;
    }
    
    .errorIcon{
        background-color: red;
        padding: 0.8vh 1.7vh;
        border-radius: 50%;
        color: white;
    }
    span{
        color: rgb(182, 8, 8);
        text-shadow: 0px 0px 1px rgba(0, 0, 0, 0.636);
        font-size: 17px;
        margin: 1.5vh;
    }
    
    @media screen and (max-width: 1000px){
        form{
            width: 65%;
        }
        input{
            width: 80%;
        }
    
    }
    @media screen and (max-width: 650px){
        form{
            width: 80%;
        }
        input{
            width: 90%;
        }
    
    }
    </style>
<script>
import axios from 'axios'
export default {
    data() {
        return {
            UserData: [],
            validation : false,
            resetPw : false,
            newPw : '',
            lastPw : '',
            FormData : {
                name : '',
                email : '',
                address : '',
                city : '',
                postCode : '',
                phone : '',
                gender : '',
                password : '',
            },
        }
    },
    mounted() {
        let token = this.$store.state.token
        axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
        axios.get("http://127.0.0.1:8000/api/Profile").then((response) => {
            this.UserData = response.data.user
            this.FormData.name = this.UserData.name
            this.FormData.email = this.UserData.email
            this.FormData.address = this.UserData.address
            this.FormData.city = this.UserData.city
            this.FormData.postCode = this.UserData.postCode
            this.FormData.phone = this.UserData.phone
            this.FormData.age = this.UserData.age
            this.FormData.password = this.UserData.password
            this.lastPw = this.UserData.password
            this.FormData.gender = this.UserData.gender
          })
          setTimeout(() => {
            let loading = document.getElementById('loading')
            loading.classList.add('d-none')
          }, 700);
    },
    methods : {
        ResetPw(){
            let profileForm = document.getElementById('profileForm')
            let resetPw = document.getElementById('resetPw')
            profileForm.classList.add('d-none')
            resetPw.classList.remove('d-none')
            window.scrollTo(0,20)
        },
        checkPw(){
            let resetPw = document.getElementById('resetPw')
            let newPw = document.getElementById('newPw')
            let databaseError2 = document.getElementById('databaseError2')
            let token = this.$store.state.token
        axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
        axios.post("http://127.0.0.1:8000/api/resetPw", this.FormData).then((response) => {
            if(response.data.message == true){
            resetPw.classList.add('d-none')
            this.FormData.password = ''                
            this.resetPw = true                
        }
          }).catch((error)=> {
            databaseError2.classList.remove('d-none')                
        });
        
    },
    newPassword(){
        let PasswordError = document.getElementById('PasswordError')
        if(!this.FormData.password.match(/^(?=.*\d)(?=.*[a-zA-Z])[a-zA-Z0-9]{8,}$/)){
            PasswordError.classList.remove('d-none')
        }
        else{
            PasswordError.classList.add('d-none')
            let token = this.$store.state.token
            axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
            axios.post("http://127.0.0.1:8000/api/changePw", this.FormData).then((response) => {
            let successPw = document.getElementById('successPw')
            successPw.classList.remove('d-none')
            setTimeout(() => {
                location.reload();
            }, 800);
            })
        }
        },
        update(){
            let error = document.getElementById('error')
            let databaseError = document.getElementById('databaseError')
            let phone = document.getElementById('phone')
            let age = document.getElementById('age')
            let address = document.getElementById('Address')
            let city = document.getElementById('City')
            let email = document.getElementById('mail')
            let MailError = document.getElementById('MailError')
            let phoneError = document.getElementById('phoneError')
            let name = document.getElementById('NAME')
            let success = document.getElementById('success')
            if(!this.FormData.name || !this.FormData.address || !this.FormData.age || !this.FormData.city){
                error.classList.remove('d-none')
            }
            if(!this.FormData.name){
                name.classList.add('error')
                return this.validation = false
            }
            else if(!this.FormData.email.match(/^[^\s@]+@[^\s@]+\.[^\s@]+$/)){
                MailError.classList.remove('d-none')
                email.classList.add('error')
                return this.validation = false
            }
            else if(!this.FormData.age){
                age.classList.add('error')
                return this.validation = false
            }
            else if(!this.FormData.phone.match(/^01[0125][0-9]{8}$/)){ 
                phoneError.classList.remove('d-none')
                phone.classList.add('error')
                return this.validation = false
            }
            else if(!this.FormData.address){
                address.classList.add('error')
                return this.validation = false
            }
            else if(!this.FormData.city){
                city.classList.add('error')
                return this.validation = false
            }
            else{
                this.FormData.password = this.lastPw
                axios.put("http://127.0.0.1:8000/api/Profile/update",this.FormData).then((response) => {
                    success.classList.remove('d-none')
                    window.scrollTo(0,480)
                    setTimeout(() => {
                        location.reload();
                    }, 1000);
          }).catch((error)=> {
            databaseError.innerText = error.response.data.message
            databaseError.classList.remove('d-none')
            window.scrollTo(0,150)
        });
            }
        },
        logout(){
            let token = this.$store.state.token
            axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
            axios.post("http://127.0.0.1:8000/api/logout").then((response) => {
                localStorage.removeItem('userToken');
                this.$router.push('/').then(()=> {
                    window.location.reload();
                });
          }).catch(function(error) {
            console.log(error.response.data.message);
          });
        },
    },
    updated() {
        let error = document.getElementById('error')
        let phone = document.getElementById('phone')
        let age = document.getElementById('age')
        let address = document.getElementById('Address')
        let city = document.getElementById('City')
        let email = document.getElementById('mail')
        let MailError = document.getElementById('MailError')
        let phoneError = document.getElementById('phoneError')
        let name = document.getElementById('NAME')
        if(this.FormData.name){
                name.classList.remove('error')
        }
        if(this.FormData.address){
                address.classList.remove('error')
        }
        if(this.FormData.city){
                city.classList.remove('error')
        }
        if(this.FormData.age){
                age.classList.remove('error')
        }
        if(this.FormData.name && this.FormData.address && this.FormData.age && this.FormData.city){
            error.classList.add('d-none')
        }
        if(this.FormData.email.match(/^[^\s@]+@[^\s@]+\.[^\s@]+$/)){
            MailError.classList.add('d-none')
            email.classList.remove('error')
        }
        if(this.FormData.phone.match(/^01[0125][0-9]{8}$/)){
            phoneError.classList.add('d-none')
            phone.classList.remove('error')
        }
    },
}

</script>