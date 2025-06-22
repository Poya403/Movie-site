<script>
import axios from 'axios';
import { ref, onMounted } from 'vue';
import { useRoute } from 'vue-router';

export default{
  name: 'AccountView',
  setup(){
    const username = ref(null);
    const route = useRoute();
    const users = ref([]);

    const fetchUserData = async () => {
      try {
        const userId = route.params.id;
        const res = await axios.get(`http://localhost:3000/account/${userId}`);
        console.log("API Response:", res.data);
        users.value = res.data;
      } catch (err) {
        console.error(err);
      }
    };



    onMounted(() => {
      username.value = localStorage.getItem('username') || null;
      fetchUserData();
    });

    return{
      username
    };
  },

}
</script>
<template>
  <h1></h1>
</template>
