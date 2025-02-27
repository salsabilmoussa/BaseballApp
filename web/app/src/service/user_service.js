import apiClient  from '@/api';

const UserService = {
    async getUsers() {
        try {
                const response = await apiClient.get('/users');
                return response.data;
            } catch (error) {
                alert("Erreur lors de la récupération des utilisateurs. Veuillez réessayer.");
            }
        },

    async addUser(userData) {
        try {
            await apiClient.post('/register', userData);
            return this.getUsers();
        } catch (error) {
            alert("Erreur lors de l'ajout d'un utilisateur. Veuillez réessayer.");
        }
    },

    async searchUsers(search){
        try {
                const response = await apiClient.get('users/search', {
                    params: {search: search}
                });
                return response.data;
            } catch (error) {
                alert("Erreur lors de la recherche. Veuillez réessayer.");
            }
    },


};
export default UserService;