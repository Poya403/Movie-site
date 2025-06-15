<script>
import axios from 'axios';
import { ref, onMounted } from 'vue';
import { useRouter } from 'vue-router';

export default {
  setup() {
    const movies = ref([]);
    const genres = ref([]);
    const searchResults = ref([]);
    const searchTerm = ref(null);
    const username = ref(null);
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
    const logout = () => {
      localStorage.removeItem('username');
      router.push('/');
    };
    onMounted(() => {
      username.value = localStorage.getItem('username') || 'کاربر';
      fetchMovies();
    });

    return {
      movies,
      genres,
      searchResults,
      searchTerm,
      searchInputHandler,
      goToMovie,
      username,
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
        <div v-show="!username">
          <router-link to="/">
            <button>ورود <i class="material-icons">login</i></button>
          </router-link>
        </div>
        <div v-show="username" class="profile-box">
          <h1 class="profile-name">{{ username }}
          <i class="material-icons">account_circle</i>
          </h1>
          <button type="button" @click="logout">
            <i class="material-icons">logout</i>
        </button>
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
  background-color: #111;
  width: 250px;
  padding: 20px;
  border-radius: 12px;
  text-align: center;
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

#title,#search{
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 20px;
    float: right;
}

#search{
    margin: 5px 50px 0;
}

.profile-box {
  direction: ltr;
  display: flex;
  justify-content: space-between;
  align-items: center;
  background: linear-gradient(90deg, #1e1f22, #2d2e33);
  color: #f0f0f0;
  padding: 10px;
  border-radius: 10px;
}

.profile-name {
  font-size: 1.2rem;
  display: flex;
  align-items: center;
  gap: 0.5rem;
  font-weight: 500;
  text-shadow: 0 0 3px #00000044;
}

.profile-box .material-icons {
  font-size: 28px;
  cursor: pointer;
  transition: transform 0.2s ease, color 0.3s;
}

.profile-box .material-icons:hover {
  transform: scale(1.1);
  color: #66ccff;
}

</style>
