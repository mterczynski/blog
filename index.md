---
layout: page
---

<script setup>
import { data as posts } from './posts.data.ts'
import { withBase } from 'vitepress'
</script>

# mterczynski's blog

A blog about web programming.

<ul class="post-list">
  <li v-for="post in posts" :key="post.url">
    <a :href="withBase(post.url)">{{ post.frontmatter.title }}</a>
    <span class="post-date"> — {{ new Date(post.frontmatter.date).toLocaleDateString('en-US', { year: 'numeric', month: 'long', day: 'numeric' }) }}</span>
  </li>
</ul>

<style>
.post-list {
  list-style: none;
  padding: 0;
}
.post-list li {
  margin: 1rem 0;
}
.post-date {
  color: var(--vp-c-text-2);
  font-size: 0.9em;
}
</style>
