<template>
    <div v-if="isOpen" class="modal">
        <div class="modal-content">
            <span class="close" @click="closeModal">&times;</span>
            <h3 class="text-2xl text-gray-700 mb-6">{{ title }}</h3>
            <form>
                <div class="form-group">
                    <label for="name">Titre</label>
                    <input type="text" v-model="formData.name" required>
                </div>
                <div class="form-group">
                    <label for="player">Joueur</label>
                    <input type="text"  v-model="formData.player" required>
                </div>
                <div class="form-group">
                    <label for="team">Equipe</label>
                    <input type="text" v-model="formData.team" required>
                </div>
                <div class="form-group">
                    <label for="year">Année</label>
                    <input type="number" v-model="formData.year" required>
                </div>
                <div class="form-group">
                    <label for="imageUrl">URL de l'image</label>
                    <input type="text" v-model="formData.imageUrl" required>
                </div>
                <div class="button-container">
                    <button type="button" class="submit-btn" @click="closeModal">Annuler</button>
                    <button type="submit" class="submit-btn" @click.prevent="submitForm">{{ submitButtonText }}</button>
                </div>
            </form>

        </div>
    </div>
</template>
<script>

export default ({
    name: 'ModalComponent',
    props:{
        isOpen:{
            type: Boolean,
            required:true,
        },
        title:{
            type: String,
            required:true,
        },
        submitButtonText:{
            type: String,
            required:true,
        },
        initialData: {
            type: Object,
            default: () => ({
                name: '',
                player: '',
                team: '',
                year: '',
                imageUrl: '',
            }),
        },
    },
    data() {
        return {
            formData: { ...this.initialData },
        };
    },
    watch: {
        initialData: {
            handler(newData) {
                this.formData = { ...newData };
            },
        },
    },
    methods: {
        closeModal() {
            this.$emit('close');
        },
        submitForm() {
            this.$emit('submit', this.formData);
        },
    },
})
</script>
