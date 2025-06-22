<script>
import axios from 'axios';
import { ref, onMounted } from 'vue';
import { useRouter } from 'vue-router';

export default {
  name: 'HomeView',
  setup() {
    const movies = ref([]);
    const genres = ref([]);
    const searchResults = ref([]);
    const searchTerm = ref(null);
    const userInfo = ref({ id: null, name: null });
    const router = useRouter();
    const fetchMovies = async () => {
      try {
        const res = await axios.get('http://localhost:3000/movies');
        movies.value = res.data.movies;
        searchResults.value = movies.value;
        genres.value = res.data.genres;
      } catch (err) {
        console.error(err);
      }
    };

    const searchInputHandler = () => {
      if (!searchTerm.value) {
        searchResults.value = movies.value;
      } else {
        searchResults.value = movies.value.filter(m =>
          m.mname.toLowerCase().includes(searchTerm.value.toLowerCase())
        );
      }
    };
    const goToMovie = (movieId) => {
      router.push(`/movies/${movieId}`);
    };
    const goToUsers = (userId) => {
      router.push(`/account/${userId}`);
    };
    const logout = () => {
      localStorage.removeItem('userInfo');
      // this.$router.go(0);
      window.location.reload();
    };
    onMounted(() => {
      const stored = JSON.parse(localStorage.getItem('userInfo')) || {};
      userInfo.value.id = stored.id || null;
      userInfo.value.name = stored.name || null;
      fetchMovies();
    });

    return {
      movies,
      genres,
      searchResults,
      searchTerm,
      searchInputHandler,
      goToMovie,
      goToUsers,
      userInfo,
      logout
    };
  }
};

</script>
<template>
  <nav>
    <h1 id="title">فیلم برتر</h1>
    <input id="search" v-model="searchTerm" @input="searchInputHandler" placeholder="جستجوی فیلم">
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
  </nav><br><br>
  <section id="movies">
    <div v-for="genre in genres" :key="genre.id" class="genre-section">
      <h2 id="genreTitle" v-if="searchResults.filter(movie => movie.gname === genre.gname).length>0">{{ genre.gname }}</h2>
      <div class="movies-container">
          <div v-for="movie in searchResults.filter(movie => movie.gname === genre.gname)"
            :key="movie.img_url" class="movie-card" @click="goToMovie(movie.mid)">
            <img :src="movie.img_url" alt="movie poster" />
            <h3>{{ movie.mname }}</h3>
          </div>
      </div>
    </div>
  </section>
</template>

<style>
*{
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}
#movies{
  margin-top: 15px;
}
.movies-container {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
  justify-content: right;
  padding: 20px;
  margin-top: 10px;
}

.movie-card {
  background: linear-gradient(90deg,rgb(29, 4, 140),rgb(75, 8, 122));
  width: 200px;
  padding: 10px;
  border-radius: 12px;
  text-align: center;
  margin-right: 10px ;
  box-shadow: 0 0 10px rgba(0,0,0,0.3);
  transition: transform 0.1s ease;
}

.movie-card:hover {
  transform: scale(1.10);
}

.movie-card img {
  width: 100%;
  height: 230px;
  border-radius: 10px;
  cursor: pointer;
}

.movie-card h3 {
  color: white;
  font-size: 16px;
  margin-top: 10px;
}

input{
  width: 30%;
  display: grid;
  margin-bottom: 30px;
  padding: 7px;
  border-radius: 5px;
}

#title{
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 20px;
  float: right;
}

#search {
  padding: 0.5rem 1rem;
  border-radius: 8px;
  border: none;
  outline: none;
  font-size: 1rem;
  margin: 0 1rem;
  flex: 1;
  max-width: 300px;
}

#search::placeholder {
  color: #cccccce6;
}

@media(max-width: 600px) {
  .movie-card{
    width: 150px;
    height: 200px;
  }
  .movie-card img {
    width: 100px;
    height: 140px;
    border-radius: 10px;
    cursor: pointer;
  }
  .movie-card h3 {
    color: white;
    font-size: 12px;
    margin-top: 5px;
  }
}
</style>
