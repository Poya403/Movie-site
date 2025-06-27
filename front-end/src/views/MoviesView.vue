<script>
import axios from 'axios';
import { ref, onMounted } from 'vue';
import { useRoute } from 'vue-router';
import { useRouter } from 'vue-router';

export default{
    name: "MoviesView",
    setup(){
      const route = useRoute();
      const movieInfo = ref([]);
      const cast = ref([]);
      const comments = ref([]);
      const userInfo = ref({ id: null, name: null });
      const router = useRouter();
      const selectedRating = ref(0);
      const commentText = ref('');
      const fetchMovieData = async () => {
        try {
          const movieId = route.params.id;
          const res = await axios.get(`http://localhost:3000/movies/${movieId}`);
          console.log("API Response:", res.data);
          movieInfo.value = res.data.movieInfo;
          cast.value = res.data.cast;
          comments.value = res.data.comments;
        } catch (err) {
          console.error("Error fetching movie:", err);
        }
      };
      const updateCommentsTable = async () => {
        try {
          const movieId = route.params.id;
          await axios.put(`http://localhost:3000/movies/${movieId}`,{
            uid: userInfo.value.id,
            rate: selectedRating.value,
            comment_text: commentText.value,
          });
          alert('نظر شما ثبت شد.');
          fetchMovieData();
          commentText.value = '';
          selectedRating.value = 0;
        } catch (err) {
          console.error('خطا در ثبت نظر :', err);
          alert('خطا در ثبت نظر!');
        }
      };
     const deleteComment = async (commentId) => {
      try {
        await axios.delete(`http://localhost:3000/comments/${commentId}`);
        alert('نظر شما حذف شد.');
        fetchMovieData();
      } catch (err) {
        console.error('خطا در حذف نظر:', err);
        alert('حذف نظر ناموفق بود.');
      }
    };
    onMounted(() => {
      const stored = JSON.parse(localStorage.getItem('userInfo')) || {};
      userInfo.value.id = stored.id || null;
      userInfo.value.name = stored.name || null;
      fetchMovieData();
    });

    const logout = () => {
      localStorage.removeItem('username');
      router.push('/');
    };

    const goToUsers = (userId) => {
      router.push(`/account/${userId}`);
    };

    const toggleStar = (n) => {
      selectedRating.value = n+1;
    };

    return {
      movieInfo,
      cast,
      comments,
      userInfo,
      logout,
      goToUsers,
      toggleStar,
      selectedRating,
      updateCommentsTable,
      deleteComment,
      commentText,
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
  <div class="comments_div">
    <h1 id="comment_title">نظرات</h1>
    <div class="comment" v-for="comment in comments" :key="comment.rid">
      <div class="comment-header">
        <i class="material-icons avatar">account_circle</i>
        <div class="user-info">
          <p class="uname">{{ comment.uname }}</p>
          <span class="date">{{ new Date(comment.date_created).toLocaleString('fa-IR') }}</span>
        </div>
        <button id="del_com_btn" type="button" v-if="String(comment.uid) === String(userInfo.id)" @click="deleteComment(comment.rid)">
            <i class="material-icons">delete</i>
        </button>
      </div>
      <i v-for="i in 5" :key="i" class="material-icons rate">{{ i <= comment.rate ? 'star' : 'star_border' }}</i>
        <p class="comment-text">{{ comment.comment_text }}</p>
    </div>
  </div>
  <br>
  <div id="rate_div">
    <p>امتیاز : از راست به چپ پر کنید.</p>
    <div id="star_div">
      <button class="star" v-for="(star, i) in 5" :key="i" @click="toggleStar(i)">
      <i class="material-icons">{{ i < selectedRating ? 'star' : 'star_border' }}</i></button>
    </div>
    <textarea id="comment" rows="10" type="text" placeholder="خوشحال میشیم نظرتون را بگید." v-model="commentText"></textarea>
    <button id="send_btn" type="button" @click="updateCommentsTable()"><i class="material-icons">send</i></button>
  </div>
</template>

<style>
*{
  direction: rtl;
}
@media (prefers-color-scheme: dark) {
  table, th, td {
    background-color: #2c2c2c;
    color: #fff;
  }

  .comment-text{
    color: white;
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

  .star{
    color: black;
  }

  .comment-text{
     color: #333;
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

  .comments_div{
    display: block;
    text-align: right;
    width: 70vh;
    height: auto;
    padding: 5vh;
    justify-self: center;
  }

  #rate_div{
    display: block;
    text-align: right;
    width: 70vh;
    height: auto;
    padding: 5vh;
    justify-self: center;
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

  .comments_div{
    display: block;
    text-align: right;
    width: 100vh;
    height: auto;
    padding: 5vh;
    justify-self: center;
  }

  #rate_div{
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

textarea{
  margin-top: 2vh;
  width: auto;
  border-radius: 10px;
}

#send_btn {
  border-radius: 30px;
  width: 40px;
  height: 40px;
  display: flex;
  justify-content: center;
  align-items: center;
}

#send_btn i {
  font-size: 16px;
  transform: scaleX(-1);
}

#star_div{
  display: grid;
  grid-template-columns: repeat(5, 1fr);
  justify-items: stretch;
  align-items: center;
  gap: 0;
  width: 10vh;
}
.star{
  background-color: transparent;
  color: #f39c12;
  margin-left: 0.5rem;
}
/* comment style */
.comment {
  background-color: transparent;
  margin-top: 1rem;
  border-radius: 1rem;
  padding: 1rem;
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
  font-family: 'Vazir', sans-serif;
}

.comment-header {
  display: flex;
  align-items: center;
  margin-bottom: 0.5rem;
}

.avatar {
  font-size: 2rem;
  color:blueviolet;
  margin-left: 0.8rem;
}

.user-info {
  flex: 1;
}

.uname {
  font-weight: bold;
  margin: 0;
}

.meta {
  font-size: 0.85rem;
  color: #777;
  margin-top: 2px;
}

.rate {
  color: #f39c12;
  margin-left: 0.5rem;
}

.comment-text {
  line-height: 1.6;
  margin-top: 0.5rem;
}

#del_com_btn{
  border-radius: 20px;
  width: 30px;
  height: 30px;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: red;
}
</style>
