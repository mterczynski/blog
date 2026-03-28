## Prerequisites

You'll need to have Node.js installed to run or build the blog.

## Install dependencies

```bash
npm install
```

## Running the blog locally

```bash
npm run dev
```

## Building the blog

```bash
npm run build
```

## Preview the build

```bash
npm run preview
```

## Theming

This blog uses VitePress. You can customize the theme by modifying the configuration in the `.vitepress` directory.
- **Configuring Default Theme:** The default theme can be customized in `.vitepress/config.js` (or `.ts`).
- **Extending Theme/CSS:** To override CSS variables (colors, fonts, etc.) or replace layout components, create or modify files in `.vitepress/theme/` (e.g., `.vitepress/theme/style.css` and `.vitepress/theme/index.js`).

For more details on theming, refer to the [VitePress Extending Default Theme guide](https://vitepress.dev/guide/extending-default-theme) or [Custom Theme guide](https://vitepress.dev/guide/custom-theme).

## WIP Articles

Work in progress (WIP) articles are written at https://github.com/mterczynski/private-blog
