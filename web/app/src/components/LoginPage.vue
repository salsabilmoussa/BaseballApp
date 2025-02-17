<template>
    <h1>Connexion</h1>
    <div class="login">
        <input type="text" placeholder="Email" />
        <input type="text" placeholder="Mot de passe" />
        <button @click="goToHome">Connexion</button>
    </div>
</template>

<script>
export default {
    name: 'LoginPage',
    methods: {
        goToHome() {
            this.$router.push("/home");
        },
    },
}
</script>

<style>
.login input {
    width: 300px;
    height: 40px;
    padding-left: 20px;
    display: block;
    margin-bottom: 30px;
    margin-right: auto;
    margin-left: auto;
    border: 1px solid skyblue;
}

.login button {
    width: 320px;
    height: 40px;
    border: 1px solid skyblue;
    background: skyblue;
    color: #fff;
    cursor: pointer;
}
</style>