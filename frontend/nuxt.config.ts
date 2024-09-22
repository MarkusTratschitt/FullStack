// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
    compatibilityDate: '2024-04-03',
    devtools: { enabled: true },
    modules: ['@pinia/nuxt', 'nginx', 'ohmyfetch', 'prisma'],
    vite: {
        css: {
            preprocessorOptions: {
            less: {
                // Options or global variables for less
                }
            }
        },
        plugins: [
            {
            name: 'vite-plugin-pug',
                transform(code, id) {
                    if (id.endsWith('.pug')) {
                        const pug = require('pug')
                        return {
                            code: pug.compile(code)(),
                            map: null  // No source-map needed here
                        }
                    }
                }
            }
        ]
    }

})
