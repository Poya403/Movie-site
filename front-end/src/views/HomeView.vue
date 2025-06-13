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
    onMounted(fetchMovies);

    return {
      movies,
      genres,
      searchResults,
      searchTerm,
      searchInputHandler,
      goToMovie
    };
  }
};

</script>
<template>
  <nav>
    <h1 id="title">فیلم برتر</h1>
    <input id="search" v-model="searchTerm" @input="searchInputHandler" placeholder="جستجوی فیلم">
    <router-link to="/">
      <button>بازگشت</button>
    </router-link>
  </nav>
  <section id="movies">
    <div v-for="genre in genres" :key="genre.id" class="genre-section">
      <h2 v-if="searchResults.filter(movie => movie.gname === genre.gname).length>0">{{ genre.gname }}</h2>
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
.movies-container {
  display: flex;
  flex-wrap: wrap;
  justify-self: end;
  gap: 10px;
  justify-content: center;
  padding: 20px;
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
  transform: scale(1.05);
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
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

input{
  width: 30%;
  display: grid;
  direction: rtl;
  justify-self: end;
  margin: auto;
  padding: 7px;
  border-radius: 5px ;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

h1,h2{
  justify-self: end;
  direction: rtl;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

#title,#search{
    justify-content: flex-end;
    float: right;
    vertical-align: center;
    margin-bottom: 20px;
}
#search{
    margin: 10px 50px 0;
}
</style>
