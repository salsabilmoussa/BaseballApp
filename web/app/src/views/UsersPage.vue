<template>
    <div>
        <Header />
        <SideBar />
        <main class="main-content">
            <h3 class="text-2xl text-gray-700 mb-6">Liste des utilisateurs</h3>
            <button @click="openAddUserModal"  class="add-card-btn">
                <i class="fas fa-plus"></i> Ajouter</button>
            <div class="search-container">
            <i class="fas fa-search search-icon"></i>
            <input type="text" v-model="search" @input="searchUsers" placeholder="Rechercher un utilisateur.." class="search-input">
            </div>
            <table class="cards-table">
                <thead>
                    <tr>
                        <th>Nom</th>
                        <th>Email</th>
                        <th>Roles</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="user in users" :key="user.id">
                        <td>{{ user.name }}</td>
                        <td>{{ user.email }}</td>
                        <td>{{ user.roles.join(', ') }}</td>
                        <td>
                            <button class="icon-btn edit-btn"><i class="fas fa-edit"></i></button>
                            <button class="icon-btn delete-btn" @click="deleteUser(user.id)"><i class="fas fa-trash-alt"></i></button>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="pagination">
                <button @click="prevPage" :disabled="currentPage == 1">Précédent</button>
                <span>Page {{ currentPage }} sur {{ totalPages }}</span>
                <button @click="nextPage" :disabled="currentPage == totalPages">Suivant</button>
            </div>
            <UserModal
            :isOpen="isModalOpen"
            :title="modalTitle"
            :submitButtonText="modalSubmitButtonText"
            :initialData="selectedUser"
            @close="closeModal"
            @submit="handleModalSubmit"
            />

        </main>
    </div>
</template>

<script>
import Header from '@/components/Header.vue';
import SideBar from '@/components/SideBar.vue';
import UserService from '@/service/user_service';
import UserModal from '@/components/UserModal.vue';

export default {
    name: 'UsersPage',
    components: {
        Header,
        SideBar,
        UserModal
    },
    data(){
        return {
            users: [],
            currentPage: 1,
            itemsPerPage: 6,
            isModalOpen: false,
            modalTitle: '',
            modalSubmitButtonText: '',
            selectedUser: {
                name: '',
                email: '',
                password: '',
                roles: [],
            },
        }
    },
    methods: {

        openAddUserModal() {
            this.modalTitle = 'Ajouter un utilisateur';
            this.modalSubmitButtonText = 'Ajouter';
            this.selectedUser= {name: '', email: '', password: '', roles: []};
            this.isModalOpen = true;
        },

        async handleModalSubmit(newData){
            this.users = await UserService.addUser(newData);
            this.closeModal();
        },

        closeModal() {
            this.isModalOpen = false;
        },
        async searchUsers(){
            this.users = await UserService.searchUsers(this.search);
        },
    },

    computed: {
        paginatedCards() {
            const start = (this.currentPage - 1) * this.itemsPerPage;
            const end = start + this.itemsPerPage;
            return this.cards.slice(start, end);
        },
        totalPages() {
            return Math.ceil(this.users.length / this.itemsPerPage);
        },
    },

    async mounted(){
        this.users = await UserService.getUsers();
    },
}
</script>

