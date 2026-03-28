module.exports = {
  tags: ["posts"],
  eleventyComputed: {
    permalink(data) {
      if (!data.page || !data.page.date || !data.page.fileSlug) {
        return undefined;
      }
      const date = data.page.date;
      const year = date.getUTCFullYear();
      const month = String(date.getUTCMonth() + 1).padStart(2, "0");
      const day = String(date.getUTCDate()).padStart(2, "0");
      return `/${year}/${month}/${day}/${data.page.fileSlug}/`;
    },
  },
};
