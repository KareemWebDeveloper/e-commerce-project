import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import { createStore } from 'vuex'
import createPersistedState from "vuex-persistedstate";
import SecureLS from "secure-ls";
const ls = new SecureLS({encodingType:'aes'})
import VueSocialAuth from 'vue-social-auth';
import './assets/main.css'

import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap/dist/js/bootstrap'
import 'font-awesome/css/font-awesome.css'
import 'font-awesome/js/all.min.js'
import 'bootstrap-vue/dist/bootstrap-vue.min.css'



const store = createStore({
    state(){
        return{
            productDetails : 'kiko',
            path : 'outlet',
            authenticated : false,
            token : '',
            CartDetails : [],
            searchResults : [],
            isAdmin : false,
            // user_id : '',
        };
    },
    mutations: {
        updateProductDetails(state,payload){
            state.productDetails= payload
        }
    },
    plugins: [
        createPersistedState({
          storage: {
            getItem: (key) => ls.get(key),
            setItem: (key, value) => ls.set(key, value),
            removeItem: (key) => ls.remove(key),
          },
        }),
      ],
})
// const store = createStore({
//     state(){
//         return{
//             productDetails : [],
//         };
//     },
// })

const app = createApp(App)
// app.use(VueSocialAuth,{
//   providers : {
//     facebook: {
//       clientId: 598111842261975,
//       redirectUri: 'http://localhost:5173/'
//     }
//   }
// })
app.use(store)
app.use(router)
// app.use(vueSocialAuth,{
//   providers: {
//     facebook: {
//       clientId: 598111842261975,
//       redirectUri: 'http://localhost:5173/'
//     }
//   }
// })
app.mount('#app')
