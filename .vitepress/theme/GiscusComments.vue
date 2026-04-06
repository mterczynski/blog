<template>
  <div v-if="isPostPage" ref="giscusContainer" class="giscus-wrapper" />
</template>

<script setup lang="ts">
import { ref, computed, onMounted, watch } from 'vue'
import { useRoute, useData } from 'vitepress'

const route = useRoute()
const { page } = useData()
const giscusContainer = ref<HTMLElement | null>(null)

const isPostPage = computed(() => page.value.relativePath.startsWith('posts/'))

function loadGiscus() {
  if (!isPostPage.value) return
  const container = giscusContainer.value
  if (!container) return

  while (container.firstChild) {
    container.removeChild(container.firstChild)
  }

  const script = document.createElement('script')
  script.src = 'https://giscus.app/client.js'
  script.setAttribute('data-repo', 'mterczynski/blog')
  script.setAttribute('data-repo-id', 'R_kgDOLN49XA')
  // To get the category ID: enable GitHub Discussions on the repo, then visit
  // https://giscus.app and configure it for mterczynski/blog to obtain the value
  script.setAttribute('data-category', 'General')
  script.setAttribute('data-category-id', 'DIC_kwDOLN49XM4CsABC')
  script.setAttribute('data-mapping', 'pathname')
  script.setAttribute('data-strict', '0')
  script.setAttribute('data-reactions-enabled', '1')
  script.setAttribute('data-emit-metadata', '0')
  script.setAttribute('data-input-position', 'bottom')
  script.setAttribute('data-theme', 'light')
  script.setAttribute('data-lang', 'en')
  script.setAttribute('crossorigin', 'anonymous')
  script.async = true
  container.appendChild(script)
}

onMounted(() => {
  loadGiscus()
})

watch(() => route.path, () => {
  loadGiscus()
})
</script>

<style scoped>
.giscus-wrapper {
  margin-top: 2rem;
  padding-top: 1.5rem;
  border-top: 1px solid var(--vp-c-divider);
}
</style>
