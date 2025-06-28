<script>
import { ref, onMounted } from 'vue';
import axios from 'axios';
import { useRoute } from 'vue-router';
import { useRouter } from 'vue-router';

export default{
  name: 'AccountEdit',
  setup(){
    const route = useRoute();
    const router = useRouter();
    const userName = ref('');
    const bio = ref('');
    const isChangingPassword = ref(false);
    const curr_password = ref('');
    const new_password = ref('');
    const rep_password = ref('');
    const showCurr = ref(false);
    const showNew = ref(false);
    const showRep = ref(false);
    const users = ref({});

    const fetchUserData = async () => {
      try {
        const userId = route.params.id;
        const res = await axios.get(`http://localhost:3000/accountEdit/${userId}`);
        users.value = res.data;
        userName.value = users.value.uname;
        bio.value = users.value.bio;
      } catch (err) {
        console.error(err);
      }
    };
    const updateUserInfo = async () => {
      try {
        const userId = route.params.id;
        await axios.put(`http://localhost:3000/accountEdit/${userId}`, {
          uname: userName.value,
          bio: bio.value,
          isChangingPassword: isChangingPassword.value,
          curr_password: curr_password.value,
          new_password: new_password.value,
        });
        router.back();
      } catch (err) {
        console.error('خطا در به‌روزرسانی کاربر:', err);
        alert('خطا در ویرایش اطلاعات!');
      }
    };
    const goback = () => {
      if(isChangingPassword.value){ isChangingPassword.value=false; return;}
      router.back();
    }
    const change_password_btn_handler = () => {
      isChangingPassword.value = true;
    }
    onMounted(()=>{
      fetchUserData();
    });
    return{
      userName,
      bio,
      isChangingPassword,
      change_password_btn_handler,
      curr_password,
      new_password,
      rep_password,
      users,
      goback,
      updateUserInfo,
      showCurr,
      showNew,
      showRep,
    };
  },
}
</script>
<template>
  <div class="main_div">
    <form>
      <section id = "Change_info field" v-if="!isChangingPassword">
        <label id="name_lbl" type="name" for="name">نام کاربری:</label>
        <input id="name" type="text" placeholder="نام کاربری جدید را وارد کنید" v-model="userName">

        <label id="bio_lbl" type="text" for="bio">بیوگرافی</label><br>
        <textarea id="bio" type="text" rows="7" placeholder="عنوان جدید بیوگرافی را وارد کنید" v-model="bio"></textarea>
        <button id="change_password_btn" type="button" @click="change_password_btn_handler()">
          تغییر رمز
        </button>
      </section>


      <section id = "Change_password field" v-if="isChangingPassword">

        <label id="curr_password_lbl" for="curr_password">رمز عبور فعلی:</label>
        <div class="password_field">
          <input id="curr_password" :type="showCurr ? 'text' : 'password'" v-model="curr_password"
            placeholder="لطفا رمز عبور فعلی را وارد کنید.">
          <button type="button" id="visibility_btn" @click="showCurr = !showCurr">
            <i class="material-icons">{{ !showCurr ? "visibility" : "visibility_off" }}</i></button>
        </div>

        <label id="new_password_lbl" for="new_password">رمز عبور جدید:</label>
        <div class="password_field">
          <input id="new_password" :type="showNew ? 'text' : 'password'" v-model="new_password"
            placeholder="لطفا رمز عبور جدید را وارد کنید.">
          <button type="button" id="visibility_btn" @click="showNew = !showNew">
            <i class="material-icons">{{ !showNew ? "visibility" : "visibility_off" }}</i></button>
        </div>


        <label id="rep_password_lbl" for="rep_password">تکرار رمز عبور جدید:</label>
        <div class="password_field">
          <input id="rep_password" :type="showRep ? 'text' : 'password'" v-model="rep_password"
            placeholder="لطفا  مجددا رمز عبور جدید را وارد کنید.">
          <button type="button" id="visibility_btn" @click="showRep = !showRep">
            <i class="material-icons">{{ !showRep ? "visibility" : "visibility_off" }}</i></button>
        </div>
      </section>
      <div class="actions">
        <button id="submit_btn" type="button" @click="updateUserInfo()">اعمال تغییرات</button>
        <button id="cancel_btn" type="button" @click="goback()">انصراف</button>
      </div>
      </form>
  </div>
</template>
<style>
.main_div{
  box-sizing: border-box;
  background: rgba(255, 255, 255, 0.1);
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%,-50%);
  padding: 15px;
  border-radius: 15px;
  width: 300px;
}
input{
  margin-top: 10px;
  width: 100%;
}
textarea{
  width: 100%;
  resize: none;
}
#cancel_btn{
  background-color: red;
}
#visibility_btn{
  background-color: gray;
  width: 20%;
}
.actions{
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 2rem;
  padding: 1rem 2rem;
  justify-items: stretch;
  align-items: center;
}

.actions button {
  height: 40px;
  white-space: nowrap;
}

.password_field {
  display: flex;
  width: 100%;
  align-items: stretch;
}

.password_field input {
  flex: 1;
  border: 1px solid #ccc;
  border-radius: 0px 10px 10px 0px;
}

.password_field button {
  margin-top: 10px;
  border: 1px solid #ccc;
  border-right: none;
  background: #eee;
  flex-shrink: 0;
  height: 33px;
  vertical-align: center;
  align-items: center;
  border-radius: 10px 0 0 10px;
}
</style>
