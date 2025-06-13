<script setup>
import { useRoute } from 'vue-router';

const route = useRoute();
</script>

<template>
  <div v-if="route.path === '/'">
    <h1>به فیلم برتر خوش آمدید.</h1>
    <router-link to="/home">
      <button>ورود به صفحه اصلی</button>
    </router-link>
  </div>

  <router-view />
</template>

<style >
button{
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  color: white;
  background-color: blueviolet;
  border-radius: 10px;
  border: none;
  padding: 10px;

}
</style>
