<template>
<div class="login-container">
    <div class="login-box">
    <h1>Connexion</h1>
    <div class="login-form">
        <div class="input-group">
        <i class="fas fa-envelope"></i>
        <input v-model="email" type="email" placeholder="Email" />
        </div>
        <div class="input-group">
        <i class="fas fa-lock"></i>
        <input v-model="password" type="password" placeholder="Mot de passe" />
        </div>
        <button @click="login">Connexion</button>
        <p v-if="errorMessage" class="error-message">{{ errorMessage }}</p>
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

<style>
body {
margin: 0;
padding: 0;
height: 100%;
}

.error-message{
    color: red;
    margin-top: 10px;
    font-size: 14px;
}

.login-container {
display: flex;
justify-content: center;
align-items: center;
height: 100vh;
background-color: #34495e;
}

.login-box {
background-color: white;
padding: 2rem;
border-radius: 8px;
box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
text-align: center;
width: 25%;
}

.login-box h1 {
margin: 0 0 1.5rem 0;
color: #34495e;
font-size: 2rem;
}

.login-form .input-group {
position: relative;
margin-bottom: 1.5rem;
}

.login-form .input-group i {
position: absolute;
left: 1rem;
top: 50%;
transform: translateY(-50%);
color: #34495e;
}

.login-form input {
width: 100%;
padding: 0.75rem 1rem 0.75rem 2.5rem;
border: 1px solid #ddd;
border-radius: 4px;
font-size: 1rem;
color: #34495e;
outline: none;
box-sizing: border-box;
}

.login-form input:focus {
border-color: #3498db;
}

.login-form button {
width: 100%;
padding: 0.75rem;
background-color: #3498db;
color: white;
border: none;
border-radius: 4px;
font-size: 1rem;
cursor: pointer;
transition: background-color 0.3s;
box-sizing: border-box;
}

.login-form button:hover {
background-color: #2980b9;
}
</style>