<script setup>
import carousel from '../components/carousel.vue'
import collections from '../components/collections.vue'
import Featured from '../components/Featured.vue'
import trending from '../components/trending.vue'
import adminWords from '../components/adminWords.vue'
import blogs from '../components/blogs.vue'
</script>

<template>
  <main>
    <carousel />
    <collections />
    <Featured />
    <trending />
    <adminWords />
    <blogs />
  </main>
</template>
<!-- <script>
export default {
  mounted(){
    window.addEventListener('scroll',function(){
      console.log('okayyy');
    })
  }
}
</script> -->
