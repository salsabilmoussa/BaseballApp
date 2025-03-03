<template>
<aside class="bg-[#34495e] text-white fixed top-[7%] left-0 w-[15%] h-[93%] flex flex-col justify-between p-4">
    <ul class="flex-1">
    <li class="my-4">
        <router-link to="home" class="flex items-center p-2 hover:bg-[#2c3e50]">
        <i class="fas fa-home mr-3 text-xl"></i>
        <span class="text-base">Accueil</span>
        </router-link>
    </li>
    <li class="my-4">
        <router-link to="/cards" class="flex items-center p-2 hover:bg-[#2c3e50]">
        <i class="fas fa-credit-card mr-3 text-xl"></i>
        <span class="text-base">Liste des cartes</span>
        </router-link>
    </li>
    <li class="my-4">
        <router-link to="users" class="flex items-center p-2 hover:bg-[#2c3e50]">
        <i class="fas fa-users mr-3 text-xl"></i>
        <span class="text-base">Liste des utilisateurs</span>
        </router-link>
    </li>
    </ul>
    <ul class="border-t border-[#2c3e50] pt-4">
    <li class="my-4">
        <router-link to="#" class="flex items-center p-2 hover:bg-[#2c3e50]">
        <i class="fas fa-cog mr-3 text-xl"></i>
        <span class="text-base">Paramètres</span>
        </router-link>
    </li>
    <li class="my-4">
        <a href="/" @click="logout" class="flex items-center p-2 hover:bg-[#2c3e50]">
        <i class="fas fa-sign-out-alt mr-3 text-xl"></i>
        <span class="text-base">Déconnexion</span>
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
