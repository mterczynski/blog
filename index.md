---
layout: home
---

<script setup>
import { data as posts } from './posts.data.ts'
</script>

# mterczynski's blog

<ul>
  <li v-for="post in posts" :key="post.url">
    <a :href="post.url">{{ post.title }}</a>
    <span> — {{ post.date }}</span>
  </li>
</ul>
