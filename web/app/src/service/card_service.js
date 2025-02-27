import  apiClient  from '@/api';

const CardService = {
    async getCards() {
        try {
                const response = await apiClient.get('/cards');
                return response.data;
            } catch (error) {
                alert("Erreur lors de la récupération des cartes. Veuillez réessayer.");
            }
        },

        async addCard(cardData) {
            try {
                await apiClient.post('/card/new', cardData);
                return this.getCards();
            } catch (error) {
                alert("Erreur lors de l'ajout de la carte. Veuillez réessayer.");
            }
        },

        async editCard(cardId, updatedData) {
            try {
                await apiClient.put(`/card/${cardId}/edit`, updatedData);
                return this.getCards();
            } catch (error) {
                alert("Erreur lors de la mise à jour de la carte. Veuillez réessayer.");
            }
        },

        async deleteCard(cardId) {
            try {
                await apiClient.delete(`/card/${cardId}`);
                return this.getCards();
            } catch (error) {
                alert("Erreur lors de la suppression de la carte. Veuillez réessayer.");
            }
        },

        async searchCards(search){
            try {
                    const response = await apiClient.get('/cards/search', {
                        params: {search: search}
                    });
                    return response.data;
                } catch (error) {
                    alert("Erreur lors de la recherche. Veuillez réessayer.");
                }
        },
};
export default CardService;