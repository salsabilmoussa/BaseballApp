<template>
    <div>
        <Header />
        <SideBar />
        <main class="main-content">
            <h3>cards</h3>
        </main>
    </div>
</template>

<script>
import Header from '@/components/Header.vue';
import SideBar from '@/components/SideBar.vue';
import { secondClient } from '@/api';

export default {
    name: 'CardsPage',
    components: {
        Header,
        SideBar
    },
    data() {
        return {
            cards: [],
        };
    },

    methods: {
    async getCards() {
        try {
                const response = await secondClient.get('/cards');
                this.cards = response.data;
            } catch (error) {
                alert("Erreur lors de la récupération des cartes. Veuillez réessayer.");
            }
        },

    async addCard(cardData) {
        try {
            await secondClient.post('/card/new', cardData);
            this.getCards();
        } catch (error) {
            alert("Erreur lors de l'ajout de la carte. Veuillez réessayer.");
        }
    },

    async deleteCard(cardId) {
        try {
            await secondClient.delete(`/card/${cardId}`);
            this.getCards();
        } catch (error) {
            alert("Erreur lors de la suppression de la carte. Veuillez réessayer.");
        }
    },

    async editCard(cardId, updatedData) {
        try {
            await secondClient.put(`/card/${cardId}/edit`, updatedData);
            this.getCards();
        } catch (error) {
            alert("Erreur lors de la mise à jour de la carte. Veuillez réessayer.");
        }
    },
},
mounted() {
        this.getCards();
    },
}
</script>
<style scoped>
.main-content {
    flex: 1;
    margin-right: 60%;
    margin-top: 5%;
}
</style>
