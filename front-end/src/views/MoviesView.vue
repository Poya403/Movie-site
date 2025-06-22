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
}
@media (max-width: 600px) {
  .movie_info{
    text-align: right;
    padding: 5vh;
  }
  .movie_info img{
    display: inline-block;
    width: 100%;
    height: 50vh;
    object-fit: cover;
    border-radius: 10px;
  }
  table {
    margin-top: 20px;
    width: 100%;
    border-collapse: collapse;
    font-size: 12px;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    text-align: right;
  }

  th, td {
    padding: 5px;
    border: 1px solid #ddd;
    color: white;
  }

  th {
    background-color: #4CAF50;
    color: white;
    text-transform: uppercase;
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
  .movie_info img{
    display: inline-block;
    width: 100%;
    height: 50vh;
    object-fit: cover;
    border-radius: 10px;
  }
  table {
    direction: rtl;
    margin-top: 20px;
    width: 50%;
    border-collapse: collapse;
    font-size: 12px;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    text-align: right;
  }

  th, td {
    padding: 5px;
    border: 1px solid #ddd;
    color: white;
  }

  th {
    background-color: #4CAF50;
    color: white;
    text-transform: uppercase;
  }
}
#title,#login_btn{
    display: flex;
    justify-content: space-between;
    align-items: center;
}
</style>
