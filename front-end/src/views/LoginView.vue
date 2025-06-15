<script>
import axios from 'axios';

export default {
  name: 'LoginView',
  data() {
    return {
      uname: '',
      password: '',
      password2: '',
      isRegistering: false,
    };
  },
  methods: {
    toggleForm() {
      this.isRegistering = !this.isRegistering;
    },
    async submitForm() {
      // بررسی رمز عبور در حالت ثبت‌نام
      if (this.isRegistering && this.password !== this.password2) {
        alert("رمز عبور مطابقت ندارد!");
        return;
      }

      const url = this.isRegistering? "http://localhost:3000/register": "http://localhost:3000/login";
      try {
        const res = await axios.post(url, {
          uname: this.uname,
          password: this.password,
        });

        if (res.data.message === "successfully login!" || res.data.message === "successfully registered!") {
          localStorage.setItem("username", this.uname);
          this.$router.push('/home');
        }

      } catch (error) {
        console.error("خطا:", error);
        alert("نام کاربری یا کلمه عبور اشتباه وارد شده.");
      }
    },
  },
};
</script>

<template>
    <h1 id="title1">به فیلم برتر خوش آمدید.</h1>
    <form class="login_form">
      <h2 id="login_title">{{ isRegistering ? "ثبت نام" : "ورود" }}</h2>

      <label id="user_name_lbl" for="name">نام کاربری :</label>
      <input id="user_name" type="text" v-model="uname" placeholder="لطفا نام کاربری را وارد کنید.">

      <label id="password_lbl" for="password">رمز عبور :</label>
      <input id="password" type="password" v-model="password" placeholder="لطفا رمز عبور را وارد کنید.">

      <label id="password_lbl2" for="password2" v-if="isRegistering">تکرار رمز عبور :</label>
      <input id="password2" type="password" v-model="password2" placeholder="لطفا  مجددا رمز عبور را وارد کنید." v-if="isRegistering">

      <button id="enter" type="button" @click="submitForm">{{ isRegistering ? "ثبت نام" : "ورود" }}</button>

      <p @click="toggleForm" style="cursor: pointer;">
      {{ isRegistering ? "قبلاً ثبت‌نام کرده‌اید؟ ورود" : "حساب ندارید؟ ثبت‌نام کنید"}}
      </p>
    </form>
</template>

<style>
#title1{
  margin-bottom: 100px ;
}
.login_form{
  background-color: rgb(75, 75, 75);
  position: absolute;
  border-radius: 10px;
  text-align: center;
  top:50%;
  left:50%;
  transform: translate(-50%,-50%);
  width: 300px;
  padding: 15px 30px;
}

#user_name,#password,#password2{
  width: 80%;
  padding: 7px;
  border: none;
  margin: 15px auto;
}
#password,#password2{ direction: ltr;}

#login_title{
  margin: 10px;
  position: relative;
  left: 50%;
  transform: translateX(-50%);
}

#enter{
  position: relative;
  left: 50%;
  transform: translateX(-50%);
}
</style>
