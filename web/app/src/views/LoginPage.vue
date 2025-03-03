<template>
<div class="flex justify-center items-center h-screen bg-[#2c3e50]">
    <div class="bg-white p-8 rounded-lg shadow-lg text-center w-1/4">
    <h1 class="text-2xl text-gray-700 mb-6">Connexion</h1>
    <div class="relative mb-6">
        <div class="relative mb-6">
        <i class="fas fa-envelope absolute left-4 top-1/2 transform -translate-y-1/2 text-gray-700"></i>
        <input class="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-md focus:outline-none text-gray-700 focus:border-blue-500" v-model="email" type="email" placeholder="Email" />
        </div>
        <div class="relative mb-6">
        <i class="fas fa-lock absolute left-4 top-1/2 transform -translate-y-1/2 text-gray-700"></i>
        <input class="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-md focus:outline-none text-gray-700 focus:border-blue-500" v-model="password" type="password" placeholder="Mot de passe" />
        </div>
        <button class="w-full bg-blue-500 text-white py-2 rounded-md hover:bg-blue-600 transition duration-300" @click="login">Connexion</button>
        <p v-if="errorMessage" class="text-red-500 mt-2.5 text-sm">{{ errorMessage }}</p>
    </div>
    </div>
</div>
</template>
<script>
import apiClient from "@/api.js";
export default {
name: 'LoginPage',
data(){
    return {
        email:"",
        password:"",
        errorMessage:"",
    }
},

methods: {
    async login() {
        try {
            const response = await apiClient.post('/admin_login', {
            username: this.email,
            password: this.password,
            });

            const token = response.data.token;
            localStorage.setItem("token", token);
            this.$router.push("/home");
        } catch (error) {
            this.errorMessage = "Identifiants incorrects. Veuillez réessayer.";
        }
        this.email = "",
        this.password= ""
        },

},

};
</script>