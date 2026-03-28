---
layout: home
---

<script setup>
import { data as posts } from './posts.data.ts'
import { withBase } from 'vitepress'

function formatDate(dateStr) {
  const date = new Date(dateStr)
  return date.toLocaleDateString('en-US', { year: 'numeric', month: 'long', day: 'numeric' })
}
</script>

# mterczynski's blog

<ul>
  <li v-for="post in posts" :key="post.url">
    <a :href="withBase(post.url)">{{ post.title }}</a>
    <span> — {{ formatDate(post.date) }}</span>
  </li>
</ul>
