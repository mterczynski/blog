import { createContentLoader } from 'vitepress'

export default createContentLoader('posts/*.md', {
  transform(rawData) {
    return rawData.sort((a, b) => {
      const dateA = a.frontmatter.date ? +new Date(a.frontmatter.date) : 0
      const dateB = b.frontmatter.date ? +new Date(b.frontmatter.date) : 0
      return dateB - dateA
    })
  }
})
