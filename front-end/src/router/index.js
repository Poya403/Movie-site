import { createRouter, createWebHistory } from 'vue-router'
import Movies from '../views/MoviesView.vue'
import Home from '../views/HomeView.vue'

const router = createRouter({
  history: createWebHistory(),
  routes: [
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
