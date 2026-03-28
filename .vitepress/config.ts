import { defineConfig } from 'vitepress'

export default defineConfig({
  title: "mterczynski's blog",
  description: 'A blog about web programming',
  base: '/blog/',
  ignoreDeadLinks: true,
  themeConfig: {
    nav: [
      { text: 'Home', link: '/' },
      { text: 'About', link: '/about' }
    ],
    socialLinks: [
      { icon: 'github', link: 'https://github.com/mterczynski' }
    ]
  }
})
