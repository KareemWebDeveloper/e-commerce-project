<script setup>
import { RouterLink, RouterView } from 'vue-router'
import NavBar from './components/NavBar.vue'
import Footer from './components/Footer.vue'
</script>

<template>
  <header>
    <NavBar v-if="showNavbar"></NavBar>
  </header>
  <RouterView />
  <Footer />

  
</template>
<script>
import axios from 'axios'
import CryptoJS from 'crypto-js';
export default {
  data() {
    return {
      productsId : [],
    }
  },
  beforeMount(){
        let authenticated = localStorage.getItem('userToken')
        if(authenticated){
          this.$store.state.authenticated = true
            let encrypted_token = authenticated;
            let token = CryptoJS.AES.decrypt(encrypted_token , 'kimoKey_2207')
            this.$store.state.token =  token.toString(CryptoJS.enc.Utf8)
        }
        else{
          this.$store.state.authenticated = false;
        }
    }, 
  computed: {
    showNavbar(){
      return !['/login','/register'].includes(this.$route.path);
    }
  }
}
</script>
