import { defineStore } from 'pinia';
import { $fetch } from 'ohmyfetch';

interface User {
  id: number;
  name: string;
}

export const useAuthStore = defineStore('auth', {
  state: () => ({
    user: null as User | null,  // Definiere den Typ für 'user'
  }),
  getters: {
    isAuthenticated: (state) => !!state.user,
  },
  actions: {
    async login(username: string, password: string) {
      try {
        const response = await $fetch('/api/login', {
          method: 'POST',
          body: { username, password },
        });
        this.user = response.user;
      } catch (error) {
        console.error('Login failed:', error);
      }
    },
    async fetchUser() {
      try {
        const response = await $fetch('/api/user');
        this.user = response.user;
      } catch (error) {
        this.user = null;
      }
    },
    async logout() {
      try {
        await $fetch('/api/logout', {
          method: 'POST',
        });
        this.user = null;
      } catch (error) {
        console.error('Logout failed:', error);
      }
    },
  },
});
