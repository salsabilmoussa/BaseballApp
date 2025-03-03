<template>
    <div>
        <Header />
        <SideBar />
        <main class="main-content">
            <h3 class="text-2xl text-gray-700 mb-6">Liste des cartes</h3>
            <button @click="openAddCardModal"  class="add-card-btn">
                <i class="fas fa-plus"></i> Ajouter</button>
            <div class="search-container">
            <i class="fas fa-search search-icon"></i>
            <input type="text" v-model="search" @input="searchCards" placeholder="Rechercher une carte.." class="search-input">
            </div>
            <table class="cards-table">
                <thead>
                    <tr>
                        <th>Titre</th>
                        <th>Joueur</th>
                        <th>Equipe</th>
                        <th>Année</th>
                        <th>Image</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="card in paginatedCards" :key="card.id">
                        <td>{{ card.name }}</td>
                        <td>{{ card.player }}</td>
                        <td>{{ card.team }}</td>
                        <td>{{ card.year }}</td>
                        <td>
                            <img :src="card.imageUrl" alt="Card Image" class="card-image">
                        </td>
                        <td>
                            <button class="icon-btn edit-btn" @click="openEditCardModal(card)"><i class="fas fa-edit"></i></button>
                            <button class="icon-btn delete-btn" @click="deleteCard(card.id)"><i class="fas fa-trash-alt"></i></button>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="pagination">
                <button @click="prevPage" :disabled="currentPage == 1">Précédent</button>
                <span>Page {{ currentPage }} sur {{ totalPages }}</span>
                <button @click="nextPage" :disabled="currentPage == totalPages">Suivant</button>
            </div>
            <CardModal
                :isOpen="isModalOpen"
                :title="modalTitle"
                :submitButtonText="modalSubmitButtonText"
                :initialData="selectedCard"
                @close="closeModal"
                @submit="handleModalSubmit"
            />
        </main>
    </div>
</template>

<script>
import Header from '@/components/Header.vue';
import SideBar from '@/components/SideBar.vue';
import CardModal from '@/components/CardModal.vue';
import CardService from '@/service/card_service';

export default {
    name: 'CardsPage',
    components: {
        Header,
        SideBar,
        CardModal
    },
    data() {
        return {
            cards: [],
            search: '',
            currentPage: 1,
            itemsPerPage: 6,
            isModalOpen: false,
            modalTitle: '',
            modalSubmitButtonText: '',
            selectedCard: {
                name: '',
                player: '',
                team: '',
                year: '',
                imageUrl: '',
            },
        };
    },

    computed: {
        paginatedCards() {
            const start = (this.currentPage - 1) * this.itemsPerPage;
            const end = start + this.itemsPerPage;
            return this.cards.slice(start, end);
        },
        totalPages() {
            return Math.ceil(this.cards.length / this.itemsPerPage);
        },
    },

    methods: {

    async searchCards(){
        this.cards = await CardService.searchCards(this.search);
    },

    openAddCardModal() {
        this.modalTitle = 'Ajouter une carte';
        this.modalSubmitButtonText = 'Ajouter';
        this.selectedCard = { name: '', player: '', team: '', year: '', imageUrl: '' };
        this.isModalOpen = true;
    },

    openEditCardModal(card) {
        this.modalTitle = 'Modifier la carte';
        this.modalSubmitButtonText = 'Modifier';
        this.selectedCard = { ...card };
        this.isModalOpen = true;
    },

    async handleModalSubmit(newData){
        if(this.selectedCard.id){
            this.cards = await CardService.editCard(this.selectedCard.id, newData);
        }
        else{
            this.cards = await CardService.addCard(newData);
        }
        this.closeModal();
    },


    closeModal() {
        this.isModalOpen = false;
    },

    prevPage(){if (this.currentPage> 1)
        this.currentPage --;
    },
    nextPage() {
            if (this.currentPage < this.totalPages) this.currentPage++;
        },


    async deleteCard(cardId) {
        this.cards = await CardService.deleteCard(cardId);
    },

},
    async mounted() {
        this.cards = await CardService.getCards();
    },
}
</script>
