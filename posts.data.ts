import { createContentLoader } from 'vitepress'

export default createContentLoader('posts/*.md', {
  excerpt: true,
  transform(raw) {
    return raw
      .map(({ url, frontmatter, excerpt }) => ({
        title: frontmatter.title,
        url,
        date: frontmatter.date,
        excerpt
      }))
      .sort((a, b) => {
        return new Date(b.date).getTime() - new Date(a.date).getTime()
      })
  }
})
