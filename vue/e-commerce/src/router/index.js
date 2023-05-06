import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import cartView from '../views/cartView.vue'
import axios from 'axios'
import CryptoJS from 'crypto-js';
const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/Men',
      name: 'Men',
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import('../views/MenView.vue')
    },
    {
      path: '/Women',
      name: 'Women',
      component: () => import('../views/WomenView.vue')
    },
    {
      path: '/footwear',
      name: 'footwear',
      component: () => import('../views/FootwearView.vue')
    },
    {
      path: '/accessories',
      name: 'accessories',
      component: () => import('../views/AccessoriesView.vue')
    },
    {
      path: '/all',
      name: 'all',
      component: () => import('../views/AllCatsView.vue')
    },
    {
      path: '/sales',
      name: 'sales',
      component: () => import('../views/SalesView.vue')
    },
    {
      path: '/cart',
      name: 'cart',
      component: () => import('../views/cartView.vue'),
      meta: {requiresAuth: true}
    },
    {
      path: '/dashboard',
      name: 'dashboard',
      component: () => import('../views/dashboardView.vue'),
      meta: {requiresAuth: true},
    },
    {
      path: '/dashboard/addCategories',
      name: 'addCategories',
      component: () => import('../views/AddCategoriesView.vue'),
      meta: {requiresAuth: true},
    },
    {
      path: '/dashboard/UserRole',
      name: 'UserRole',
      component: () => import('../views/editUserRole.vue'),
      meta: {requiresAuth: true},
    },
    {
      path: '/dashboard/Products',
      name: 'Products',
      component: () => import('../views/editProductsView.vue'),
      meta: {requiresAuth: true},
    },
    {
      path: '/productDetails',
      name: 'productDetails',
      component: () => import('../views/productDetailsView.vue')
    },
    {
      path: '/login',
      name: 'LoginPage',
      component: () => import('../views/loginView.vue')
    },
    {
      path: '/register',
      name: 'register',
      component: () => import('../views/registerView.vue')
    },
    {
      path: '/search/results',
      name: 'search',
      component: () => import('../views/SearchResultsView.vue')
    },
    {
      path: '/profile',
      name: 'profile',
      component: () => import('../views/ProfileView.vue'),
      meta: {requiresAuth: true}
    },

  ]
})
router.beforeEach((to,from,next)=>{

  if(to.matched.some(record => record.meta.requiresAuth) && !isAuthenticated()){
    // if the route requires authentication and the user is not authenticated , redirect to the login page
    next('/login')
  }
  else{
    //otherwise allow the user to access the requested route
    next()
  }
})
function isAuthenticated(){
  return localStorage.getItem('userToken')!== null
}


export default router
