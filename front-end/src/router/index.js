import { createRouter, createWebHistory } from 'vue-router'
import Movies from '../views/MoviesView.vue'
import Home from '../views/HomeView.vue'
import LoginView from '../views/LoginView.vue'
import Account from '../views/AccountView.vue'
import AccountEdit from '../views/AccountEdit.vue'

const router = createRouter({
  history: createWebHistory(),
  routes: [
    { path: '/login',
      name: 'LoginView',
      component: LoginView
    },
    {
      path : '/',
      name: 'HomeView',
      component: Home
    },
    {
      path: '/movies/:id',
      name: 'MoviesView',
      component: Movies
    },
    {
      path: '/account/:id',
      name: 'AccountView',
      component : Account
    },
    {
      path: '/accountEdit/:id',
      name: 'AccountEdit',
      component : AccountEdit
    }
  ],
})

export default router
