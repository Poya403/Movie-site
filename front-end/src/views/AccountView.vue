<script>
import router from '@/router';
import axios from 'axios';
import { ref, onMounted } from 'vue';
import { useRoute } from 'vue-router';

export default{
  name: 'AccountView',
  setup(){
    const route = useRoute();
    const users = ref({});
    const userInfo = ref({ id: null, name: null });
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
      // ذخیره کردن اطلاعات کاربری که الان وارد سایت شده
      const stored = JSON.parse(localStorage.getItem('userInfo')) || {};
      userInfo.value.id = stored.id || null;
      userInfo.value.name = stored.name || null;
      fetchUserData();
    });

    const logout = () => {
      localStorage.removeItem('userInfo');
      router.push('/login');
    };

    const GotoEdit = (userId) => {
      router.push(`/accountEdit/${userId}`);
    };

    return{
      users,
      userInfo,
      logout,
      GotoEdit
    };
  },

}
</script>
<template>
  <div id="account-info">
    <section class="profile">
      <i id="profile-icon" class="material-icons">account_circle</i>
      <h1 class="username">{{ users.uname }}</h1>
    </section>

    <section class="details">
      <h2 id="bio">بیوگرافی: {{ users.bio ?? 'empty' }}</h2>
      <h3>تاریخ و زمان ثبت‌نام: {{ new Date(users.registration_date).toLocaleString('fa-IR') }}</h3>
    </section>

    <section class="actions" v-if="users.uid == userInfo.id">
      <button id="Edit" type="button" @click="GotoEdit(users.uid)">
        <i class="material-icons">edit</i>
        <span>ویرایش اطلاعات</span>
      </button>
      <button id="logout" type="button" @click="logout()">
        <i class="material-icons">logout</i>
        <span>خروج از حساب</span>
      </button>
    </section>
  </div>
</template>

<style>
#account-info {
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(16px);
  -webkit-backdrop-filter: blur(16px);
  border-radius: 20px;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.25);
  color: #fff;
  width: 90%;
  max-width: 500px;
  margin: 5rem auto;
  font-family: 'Vazirmatn', sans-serif;
  border: 1px solid rgba(255, 255, 255, 0.2);
  padding-bottom: 2rem;
}

.profile {
  display: flex;
  flex-direction: column;
  align-items: center;
  background: linear-gradient(90deg, #3f51b5, #7e57c2);
  padding: 2rem 1rem 1rem;
  border-radius: 20px 20px 0 0;
  position: relative;
}

#profile-icon {
  font-size: 8rem;
  color: #fff;
  margin-bottom: 0.5rem;
  position: absolute;
  top: -4rem;
  background: linear-gradient(135deg, #5c6bc0, #9575cd);
  border-radius: 50%;
  padding: 1rem;
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.4);
}

.username {
  margin-top: 6rem;
  font-size: 1.5rem;
  font-weight: bold;
  color: #f5f5f5;
}

.details {
  text-align: right;
  padding: 1.5rem 2rem;
  color: #ccc;
}

.details h2,
.details h3 {
  margin: 0.5rem 0;
  direction: rtl;
}

.actions {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 2rem;
  padding: 1rem 2rem;
  justify-items: center;
}

.btn{
  background-color: transparent;
  border: none;
  color: white;
  cursor: pointer;
  font-size: 1.2rem;
  transition: color 0.1s ease;
}

#bio {
  font-size: 1.1rem;
  border-radius: 8px;
  margin: 1rem 0;
  font-style: italic;
  transition: background-color 0.3s ease;
}

#logout{
  background-color: red;
}
</style>
