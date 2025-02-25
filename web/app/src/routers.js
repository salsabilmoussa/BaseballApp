import CardPage from './views/CardsPage.vue'
import HomePage from './views/HomePage.vue'
import LoginPage from './views/LoginPage.vue'
import { createRouter, createWebHistory } from 'vue-router'
import UserPage from './views/UsersPage.vue'

const routes = [
    {
        name: 'Home',
        component: HomePage,
        path: '/home',
        meta: { requiresAuth: true }
    },
    {
        name: 'Login',
        component: LoginPage,
        path: '/'
    },
    {
        name: 'Card',
        component: CardPage,
        path: '/cards',
        meta: { requiresAuth: true }
    },
    {
        name: 'User',
        component: UserPage,
        path: '/users',
        meta: { requiresAuth: true }
    }
]

const router = createRouter({
    history: createWebHistory(),
    routes,
})

router.beforeEach((to, from, next) => {
    const token = localStorage.getItem("token");
    if (to.meta.requiresAuth && !token) {
        next('/');
    } else {
        next();
    }
});

export default router;
