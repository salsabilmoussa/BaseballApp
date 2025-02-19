import axios from "axios";

const apiClient = axios.create({
    baseURL: process.env.VUE_APP_API_URL,
    headers: {
        "Content-Type": "application/json"
    }
});

const secondClient = axios.create({
    baseURL: process.env.VUE_APP_URL,
    headers: {
        "Content-Type": "application/json"
    }
});

export { apiClient, secondClient };
