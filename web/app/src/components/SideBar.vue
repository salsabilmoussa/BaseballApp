<template>
<aside class="sidebar">
    <ul class="sidebar-top">
    <li>
        <router-link to="home">
        <i class="fas fa-home"></i>
        <span>Accueil</span>
        </router-link>
    </li>
    <li>
        <router-link to="/cards">
        <i class="fas fa-credit-card"></i>
        <span>Liste des cartes</span>
        </router-link>
    </li>
    <li>
        <router-link to="users">
        <i class="fas fa-users"></i>
        <span>Liste des utilisateurs</span>
        </router-link>
    </li>
    </ul>
    <ul class="sidebar-bottom">
    <li>
        <router-link to="#">
        <i class="fas fa-cog"></i>
        <span>Paramètres</span>
        </router-link>
    </li>
    <li>
        <a href="/" @click="logout">
        <i class="fas fa-sign-out-alt"></i>
        <span>Déconnexion</span>
        </a>
    </li>
    </ul>
</aside>
</template>

<script>
export default {
name: 'SideBar',
methods: {
    logout() {
        localStorage.removeItem("token");
    },
},
};
</script>

<style>
.sidebar {
    background-color: #34495e;
    color: white;
    position: fixed;
    top: 7%;
    left: 0;
    width: 15%;
    height: 93%;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    padding: 1rem 0;
}

.sidebar ul {
    list-style: none;
    padding: 0;
    margin: 0;
}

.sidebar ul li {
    margin: 1rem 0;
}

.sidebar ul li a {
    color: white;
    text-decoration: none;
    display: flex;
    align-items: center;
    padding: 0.5rem 1rem;
    transition: background-color 0.3s;
}

.sidebar ul li a:hover {
    background-color: #2c3e50;
}

.sidebar ul li a i {
    margin-right: 0.75rem;
    font-size: 1.2rem;
}

.sidebar ul li a span {
    font-size: 1rem;
}

.sidebar-top {
    flex: 1;
}

.sidebar-bottom {
    border-top: 1px solid #2c3e50;
    padding-top: 1rem;
}
</style>