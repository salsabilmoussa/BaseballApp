import HomePage from './components/HomePage.vue'
import LoginPage from './components/LoginPage.vue'
import { createRouter, createWebHistory } from 'vue-router'

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
    }
]

const router = createRouter({
    history: createWebHistory(),
    routes,
})

export default router;
