<script>
import axios from 'axios';
import { ref, onMounted } from 'vue';
import { useRoute } from 'vue-router';
import { useRouter } from 'vue-router';

export default{
    setup(){
      const route = useRoute();
      const movieInfo = ref([]);
      const cast = ref([]);
      const userInfo = ref({ id: null, name: null });
      const router = useRouter();
      const fetchMovieِData = async () => {
      try {
        const movieId = route.params.id;
        const res = await axios.get(`http://localhost:3000/movies/${movieId}`);
        console.log("API Response:", res.data);
        movieInfo.value = res.data.movieInfo;
        cast.value = res.data.cast;
      } catch (err) {
        console.error("Error fetching movie:", err);
      }
    };

    onMounted(() => {
      const stored = JSON.parse(localStorage.getItem('userInfo')) || {};
      userInfo.value.id = stored.id || null;
      userInfo.value.name = stored.name || null;
      fetchMovieِData();
    });

    const logout = () => {
      localStorage.removeItem('username');
      router.push('/');
    };

    const goToUsers = (userId) => {
      router.push(`/account/${userId}`);
    };

    return {
      movieInfo,
      cast,
      userInfo,
      logout,
      goToUsers
    };

    }
}
</script>

<template>
    <nav>
    <h1 id="title">فیلم برتر</h1>
    <section id="Registration status">
        <div v-show="userInfo.name" class="profile-box">
          <h1 class="profile-name">{{ userInfo.name }}
          <i class="material-icons"  @click="goToUsers(userInfo.id)">account_circle</i>
          </h1>
          <button id="logout_btn" type="button" @click="logout">
            <i class="material-icons">logout</i>
          </button>
        </div>
        <div v-show="!userInfo.name">
          <router-link to="/login">
            <button>ورود <i class="material-icons">login</i></button>
          </router-link>
        </div>
    </section>
  </nav><br>
  <div class="movie_info">
    <img :src="movieInfo.img_url" alt="movie poster" />
    <h1>{{ movieInfo.mname }}</h1>
    <h4>{{ movieInfo.genres }}</h4>
    <h3>کارگردان : {{ movieInfo.dname }}</h3>
    <h4>امتیاز IMDb : {{ movieInfo.rate }}</h4>
    <h4>تاریخ انتشار : {{ movieInfo.initial_release }}</h4>
    <h3>توضیحات : {{ movieInfo.title }}</h3><br>
    <h1>اسامی بازیگران</h1>
    <table id="cast_table">
      <thead>
        <tr>
          <th>نام</th>
          <th>در نقش</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="actor in cast" :key="actor.aname">
          <td>{{ actor.aname }}</td>
          <td>{{ actor.role_in_movie }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<style>
*{
  direction: rtl;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}
@media (prefers-color-scheme: dark) {
  table, th, td {
    background-color: #2c2c2c;
    color: #fff;
  }
}

@media (prefers-color-scheme: light) {
  table, th, td {
    background-color: #f9f9f9;
    color: #222;
  }

  th {
    background-color: #4CAF50;
    color: white;
  }
}

@media (max-width: 600px) {
  .movie_info{
    padding: 5vh;
    font-size: 12px;
  }

  table {
    margin-top: 20px;
    width: 100%;
    border-collapse: collapse;
    font-size: 10px;
    text-align: right;
  }
}

@media (min-width: 610px) {
  .movie_info{
    display: block;
    text-align: right;
    width: 100vh;
    height: auto;
    padding: 5vh;
    justify-self: center;
  }
  table {
    margin-top: 20px;
    width: 50%;
    border-collapse: collapse;
    font-size: 12px;
    text-align: right;
  }
}

#title,#login_btn{
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.movie_info img{
  display: inline-block;
  width: 100%;
  height: 50vh;
  object-fit: cover;
  border-radius: 15px;
}

th, td {
  padding: 5px;
  border: 1px solid #ddd;
}
</style>
