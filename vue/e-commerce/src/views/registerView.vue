<template>
    <div class="LoginPage">
        <form @submit.prevent="validate">
            <h1 class="header">Fashion</h1>
            <span class="databaseError d-none" id="databaseError"></span>
            <label for="name">Full Name <i class="fa-solid fa-user"></i></label>
            <input type="text" name="FullName" id="name" placeholder="Enter your Fullname .." v-model="this.FormData.name">
            <label for="mail">Email Address <i class="fa-solid fa-envelope"></i></label>
            <input type="email" name="email" id="mail" placeholder="Enter your Email address .." v-model="this.FormData.email">
            <span class="d-none" id="MailError">Please enter a valid email</span>
            <label for="age">Age</label>
            <input type="number" name="age" placeholder="Enter your age .." id="age" v-model="this.FormData.age">
            <label for="phone">Phone Number</label>
            <input type="text" name="phone" placeholder="Enter your phone number .." id="phone" v-model="this.FormData.phone">
            <span class="d-none" id="phoneError">Please enter a valid phone number</span>
            <label for="address">Address</label>
            <input type="text" name="address" placeholder="Enter your address .." id="address" v-model="this.FormData.address">
            <label for="city">City</label>
            <input type="text" name="City" placeholder="Enter your City .." id="city" v-model="this.FormData.city">
            <label for="pw">Password <i class="fa-solid fa-key"></i></label>
            <input type="password" name="password" id="pw" placeholder="Enter your password .." v-model="this.FormData.password">
            <span class="d-none" id="PasswordError">Please enter a password of min 8 characters which at least contains one digit</span>
            <label for="pw_2">Confirm Password <i class="fa-solid fa-key"></i></label>
            <input type="password" name="password_confirmation" id="pw_2" placeholder="Confirm your password .." v-model="this.FormData.password_confirmation">
            <span class="d-none" id="pwConfrimError">passwords are not matching</span>
            <select v-model="this.FormData.gender" id="gender" value="Choose Gender">
                <option value="" class="optionn">Choose Gender</option>
                <option value="male">Male</option>
                <option value="female">Female</option>
            </select>
            <input type="submit" class="submit" value="Register">
            <span class="d-none" id="error"><i class="fa-solid fa-exclamation errorIcon"></i> Please enter the empty field</span>
            <RouterLink to="/login" class="registerLink">already have an account? login from here</RouterLink>
        </form>        
    </div>
</template>
<style scoped>
@import url('https://fonts.googleapis.com/css2?family=PT+Sans&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Kaushan+Script&display=swap');
.LoginPage{
    background: #1a1b20 url(../images/wallpaper.jpg) fixed;
    background-size: cover;
    font-family: 'PT Sans', sans-serif;
    padding: 15vh 0;
}
form{
    width: 33%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    padding: 5vh 3vh 8vh;
    border-radius: 20px;
    background-color: rgba(240, 248, 255, 0.374);
    text-align: center;
    margin: auto;
}
form img{
    width: 40%;
    margin: 0vh auto 3vh;
    border-bottom: 2px solid black;
}
input,select{
    width: 65%;
    margin: 2vh auto;
    text-align: center;
    padding: 1.8vh;
    border: none;
    border-bottom: 2px solid black;
    border-radius: 4px;
    background-color: rgba(255, 255, 255, 0.675);
}
label{
    font-size: 17px;
}
.header{
    margin-bottom: 2vh !important;
    font-family: 'Kaushan Script', cursive;
    text-shadow: 0px 0px 4px black;
    color: rgba(255, 255, 255, 0.808);
    border-bottom: 2px solid black;
    width: 30%;
    font-size: 35px;
    text-align: center;
    margin: 2vh auto;
    padding: 1vh;
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
.databaseError{
    padding: 1vh 2vh;
    background-color: red;
    color: white;
}
span{
    width: 65%;
    text-align: center;
    color: rgb(182, 8, 8);
    text-shadow: 0px 0px 1px rgba(0, 0, 0, 0.326);
    font-size: 15px;
    margin: 1vh auto 2vh;
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
import axios from "axios";
import CryptoJS from 'crypto-js';
export default {
    data() {
        return {
            FormData:{
                name: '',
                email: '',
                password: '',
                password_confirmation: '',
                age: '',
                gender: '',
                phone: '',
                address: '',
                city: '',
                postCode: '',
            },
            validation : false
        }
    },
    methods: {
        validate(){
            let error = document.getElementById('error')
            let phone = document.getElementById('phone')
            let age = document.getElementById('age')
            let address = document.getElementById('address')
            let gender = document.getElementById('gender')
            let city = document.getElementById('city')
            let email = document.getElementById('mail')
            let password = document.getElementById('pw')
            let MailError = document.getElementById('MailError')
            let phoneError = document.getElementById('phoneError')
            let PasswordError = document.getElementById('PasswordError')
            let name = document.getElementById('name')
            let ConfrimPassword = document.getElementById('pw_2')
            let pwConfrimError = document.getElementById('pwConfrimError')
            
            // check if the input values are empty are not
            if(!this.FormData.name || !this.FormData.address || !this.FormData.age || !this.FormData.city || !this.FormData.gender){
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
            else if(!this.FormData.password.match(/^(?=.*\d)(?=.*[a-zA-Z])[a-zA-Z0-9]{8,}$/)){
                password.classList.add('error')
                ConfrimPassword.classList.add('error')
                PasswordError.classList.remove('d-none')
                return this.validation = false
            }
            else if(this.FormData.password !== this.FormData.password_confirmation){
                pwConfrimError.classList.remove('d-none')
                ConfrimPassword.classList.add('error')
                return this.validation = false
            }
            else if(!this.FormData.gender){
                gender.classList.add('error')
                return this.validation = false
            }
            // invoke 'Register' function to send entered data to the register api to store data
            else{
                this.Register();
                return this.validation = true
            }
        },
        Register(){
            let res = axios.post("http://127.0.0.1:8000/api/Register",this.FormData).then((response) => {
                let token = response.data.Token;
                let encryptedToken = CryptoJS.AES.encrypt(token , 'kimoKey_2207').toString()
                localStorage.setItem('userToken',encryptedToken)
                this.$router.push('/').then(()=> {
                    window.scrollTo(0,20)
                    window.location.reload();
                });
          }).catch(function(error) {
            let databaseError = document.getElementById('databaseError');
            console.log(error.response.data.message);
            databaseError.textContent = error.response.data.message;
            databaseError.classList.remove('d-none')
          });
         }
        },
    updated() {
            let error = document.getElementById('error')
            let phone = document.getElementById('phone')
            let age = document.getElementById('age')
            let address = document.getElementById('address')
            let gender = document.getElementById('gender')
            let city = document.getElementById('city')
            let email = document.getElementById('mail')
            let password = document.getElementById('pw')
            let MailError = document.getElementById('MailError')
            let phoneError = document.getElementById('phoneError')
            let PasswordError = document.getElementById('PasswordError')
            let name = document.getElementById('name')
            let ConfrimPassword = document.getElementById('pw_2')
            let pwConfrimError = document.getElementById('pwConfrimError')
        if(this.FormData.name){
                name.classList.remove('error')
        }
        if(this.FormData.address){
                address.classList.remove('error')
        }
        if(this.FormData.gender){
                gender.classList.remove('error')
        }
        if(this.FormData.city){
                city.classList.remove('error')
        }
        if(this.FormData.age){
                age.classList.remove('error')
        }
        if(this.FormData.name && this.FormData.address && this.FormData.age && this.FormData.city && this.FormData.gender){
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
        if(this.FormData.password.match(/^(?=.*\d)(?=.*[a-zA-Z])[a-zA-Z0-9]{8,}$/)){
            password.classList.remove('error')
            ConfrimPassword.classList.remove('error')
            PasswordError.classList.add('d-none')
        }
        if(this.FormData.password == this.FormData.password_confirmation){
            pwConfrimError.classList.add('d-none')
            ConfrimPassword.classList.remove('error')
        }
    },
}
</script>

