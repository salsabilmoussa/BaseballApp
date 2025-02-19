<template>
    <div>
        <Header />
        <SideBar />
        <main class="main-content">
            <h3>users</h3>
        </main>
    </div>
</template>

<script>
import Header from '@/components/Header.vue';
import SideBar from '@/components/SideBar.vue';


export default {
    name: 'UsersPage',
    components: {
        Header,
        SideBar
    },

}
</script>
<style>
.main-content {
    flex: 1;
    margin-right: 60%;
    margin-top: 5%;
}
</style>
