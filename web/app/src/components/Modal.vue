<template>
    <div v-if="isOpen" class="modal">
        <div class="modal-content">
            <span class="close" @click="closeModal">&times;</span>
            <h3>{{ title }}</h3>
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

<style>
.modal {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    display: flex;
    justify-content: center;
    align-items: center;
}

.modal-content {
    background-color: white;
    padding: 20px;
    border-radius: 8px;
    width: 400px;
    position: relative;
}

.close {
    position: absolute;
    top: 10px;
    right: 10px;
    font-size: 1.5rem;
    cursor: pointer;
}

.form-group {
    margin-bottom: 1rem;
}

.form-group label {
    display: block;
    margin-bottom: 0.5rem;
}

.form-group input {
    width: 90%;
    padding: 8px;
    border: 1px solid #ddd;
    border-radius: 4px;
}

.submit-btn {
    padding: 10px 20px;
    background-color: #3498db;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 1rem;
    transition: background-color 0.3s ease;
}
.button-container {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 20px;
}

</style>