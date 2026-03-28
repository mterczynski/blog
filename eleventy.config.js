const syntaxHighlight = require("@11ty/eleventy-plugin-syntaxhighlight");

module.exports = function (eleventyConfig) {
  eleventyConfig.addPlugin(syntaxHighlight);

  eleventyConfig.addPassthroughCopy("assets");

  // Support .markdown extension in addition to .md
  eleventyConfig.addExtension("markdown", { key: "md" });

  // Handle Jekyll date format: "2024-02-28 22:34:02 +0100"
  eleventyConfig.addDateParsing((value) => {
    if (typeof value === "string") {
      const iso = value.replace(
        /^(\d{4}-\d{2}-\d{2}) (\d{2}:\d{2}:\d{2}) ([+-])(\d{2})(\d{2})$/,
        "$1T$2$3$4:$5"
      );
      if (iso !== value) {
        const date = new Date(iso);
        if (!isNaN(date.getTime())) {
          return date;
        }
      }
    }
  });

  eleventyConfig.addFilter("postDate", function (date) {
    return new Date(date).toLocaleDateString("en-US", {
      year: "numeric",
      month: "long",
      day: "numeric",
    });
  });

  return {
    dir: {
      input: ".",
      output: "_site",
      includes: "_includes",
      data: "_data",
    },
    pathPrefix: "/blog",
    templateFormats: ["md", "markdown", "njk", "html"],
    markdownTemplateEngine: "njk",
    htmlTemplateEngine: "njk",
  };
};
