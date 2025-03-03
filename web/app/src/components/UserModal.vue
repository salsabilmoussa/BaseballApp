<template>
    <div v-if="isOpen" class="modal">
        <div class="modal-content">
            <span class="close" @click="closeModal">&times;</span>
            <h3 class="text-2xl text-gray-700 mb-6">{{ title }}</h3>
            <form>
                <div class="form-group">
                    <label for="name">Nom</label>
                    <input type="text" v-model="formData.name" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="text"  v-model="formData.email" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="text" v-model="formData.password" required>
                </div>
                <div class="form-group">
                    <label for="role">Role</label>
                    <select v-model="formData.selectedRole">
                        <option value="ROLE_USER">ROLE_USER</option>
                        <option value="ROLE_ADMIN">ROLE_ADMIN</option>
                    </select>
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
                email: '',
                password: '',
                selectedRole: '',
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
