import { createRouter, createWebHistory } from 'vue-router'
import Movies from '../views/MoviesView.vue'
import Home from '../views/HomeView.vue'
import LoginView from '../views/LoginView.vue'

const router = createRouter({
  history: createWebHistory(),
  routes: [
    { path: '/', name: 'LoginView', component: LoginView },
    {
      path : '/home',
      name: 'HomeView',
      component: Home
    },
    {
      path: '/movies/:id',
      name: 'MoviesView',
      component: Movies
    },
  ],
})

export default router
