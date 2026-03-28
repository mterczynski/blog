import { defineConfig } from 'vitepress'

export default defineConfig({
  title: "mterczynski's blog",
  description: "mterczynski's blog",
  base: '/blog/',
  ignoreDeadLinks: true,
  themeConfig: {
    nav: [
      { text: 'Home', link: '/' },
      { text: 'About', link: '/about' }
    ],
    socialLinks: []
  },
  vite: {
    plugins: [
      {
        name: 'handle-public-asset-imports',
        enforce: 'pre',
        resolveId(id) {
          if (id.startsWith('/blog/assets/')) {
            return '\0virtual:public-asset:' + id
          }
        },
        load(id) {
          if (id.startsWith('\0virtual:public-asset:')) {
            const realId = id.replace('\0virtual:public-asset:', '')
            return `export default ${JSON.stringify(realId)}`
          }
        }
      }
    ]
  }
})
