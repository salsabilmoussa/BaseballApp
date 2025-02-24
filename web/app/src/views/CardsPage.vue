<template>
    <div>
        <Header />
        <SideBar />
        <main class="main-content">
            <h3>Liste des cartes</h3>
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
            <ModalComponent
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
import { secondClient } from '@/api';
import ModalComponent from '@/components/Modal.vue';
import '@/assets/styles.css';

export default {
    name: 'CardsPage',
    components: {
        Header,
        SideBar,
        ModalComponent
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
                id: null,
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
        try {
                const response = await secondClient.get('/cards/search', {
                    params: {search: this.search}
                });
                this.cards = response.data;
            } catch (error) {
                alert("Erreur lors de la recherche. Veuillez réessayer.");
            }
    },

    openAddCardModal() {
        this.modalTitle = 'Ajouter une carte';
        this.modalSubmitButtonText = 'Ajouter';
        this.selectedCard = { id: null, name: '', player: '', team: '', year: '', imageUrl: '' };
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
            await this.editCard(this.selectedCard.id, newData);
        }
        else{
            await this.addCard(newData);
        }
        this.closeModal();
    },


    closeModal() {
        this.isModalOpen = false;
    },


    async getCards() {
        try {
                const response = await secondClient.get('/cards');
                this.cards = response.data;
            } catch (error) {
                alert("Erreur lors de la récupération des cartes. Veuillez réessayer.");
            }
        },
    prevPage(){if (this.currentPage> 1)
        this.currentPage --;
    },
    nextPage() {
            if (this.currentPage < this.totalPages) this.currentPage++;
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
