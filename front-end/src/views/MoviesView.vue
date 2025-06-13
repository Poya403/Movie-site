<script>
import axios from 'axios';
import { ref, onMounted } from 'vue';
import { useRoute } from 'vue-router';


export default{
    setup(){
      const route = useRoute();
      const movieInfo = ref([]);
      const fetchMovies = async () => {
      try {
        const movieId = route.params.id;
        const res = await axios.get(`http://localhost:3000/movies/${movieId}`);
        console.log("API Response:", res.data);
        movieInfo.value = res.data.movieInfo;
      } catch (err) {
        console.error("Error fetching movie:", err);
      }
    };
      onMounted(fetchMovies);

      return {
        movieInfo
      };
    }

}
</script>

<template>
  <div class="movie_info">
    <img :src="movieInfo.img_url" alt="movie poster" />
    <h1>{{ movieInfo.mname }}</h1>
    <h2>{{ movieInfo.genres }}</h2>
    <h2>کارگردان : {{ movieInfo.dname }}</h2>
    <h3><span>(imdb)</span>امتیاز  : {{ movieInfo.rate }}</h3>
    <h3>توضیحات : {{ movieInfo.title }}</h3>
  </div>
</template>

<style>
  .movie_info{
    display: block;
    float: right;
    background-color: black;
    text-align: right;
    width: 100vh;
    height: 150vh;
    padding: 5vh;
  }
  .movie_info img{
    display: inline-block;
    width: 230px;
    height: 350px;
    object-fit: cover;
  }
</style>
