import { defineConfig } from 'vitepress'

export default defineConfig({
  description: "Personal blog about web programming, JavaScript, TypeScript and software engineering.",
  base: '/',
  sitemap: {
    hostname: 'https://www.mter.pl'
  },
  head: [
    ['meta', { name: 'theme-color', content: '#4338ca' }],
    ['meta', { name: 'robots', content: 'index, follow' }],
    ['meta', { property: 'og:type', content: 'website' }],
    ['meta', { property: 'og:title', content: "mterczynski's blog" }],
    ['meta', { property: 'og:description', content: 'Personal blog about web programming, JavaScript, TypeScript and software engineering.' }],
    ['meta', { property: 'og:locale', content: 'en_US' }],
    ['meta', { name: 'twitter:card', content: 'summary_large_image' }]
  ],
  lang: 'en-US',
  lastUpdated: false,
  cleanUrls: true,
  srcExclude: ['Readme.md'],
  ignoreDeadLinks: true,
  router: {
    prefetchLinks: false
  },
  appearance: false,
  themeConfig: {
    nav: [
      { text: 'Home', link: '/' },
      { text: 'About', link: '/about' }
    ],
    socialLinks: []
  }
})
