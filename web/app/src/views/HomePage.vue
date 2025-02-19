<template>
<div>
    <Header />
    <SideBar />
    <main class="main-content">
            <h3>home</h3>
        </main>
</div>
</template>

<script>
import SideBar from '@/components/SideBar.vue';
import Header from '../components/Header.vue'
export default {
    name: 'HomePage',
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
