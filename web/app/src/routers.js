import CardPage from './views/CardsPage.vue'
import HomePage from './views/HomePage.vue'
import LoginPage from './views/LoginPage.vue'
import { createRouter, createWebHistory } from 'vue-router'
import UserPage from './views/UsersPage.vue'

const routes = [
    {
        name: 'Home',
        component: HomePage,
        path: '/home'
    },
    {
        name: 'Login',
        component: LoginPage,
        path: '/'
    },
    {
        name: 'Card',
        component: CardPage,
        path: '/cards'
    },
    {
        name: 'User',
        component: UserPage,
        path: '/users'
    }
]

const router = createRouter({
    history: createWebHistory(),
    routes,
})

export default router;
