import { defineConfig } from 'astro/config';
import mdx from '@astrojs/mdx';
import sitemap from '@astrojs/sitemap';

export default defineConfig({
  site: 'http://www.mter.pl',
  base: '/blog',
  integrations: [mdx(), sitemap()],
});
