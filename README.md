# mterczynski's blog

This blog is built using [Hugo](https://gohugo.io/), a fast and flexible static site generator.

## Prerequisites

You'll need to have [Hugo](https://gohugo.io/installation/) installed to run or build the application.

## Install Hugo

Follow the official [Hugo installation guide](https://gohugo.io/installation/) for your operating system.

For Linux/macOS (using Homebrew):
```bash
brew install hugo
```

For Windows (using Chocolatey):
```bash
choco install hugo-extended
```

Or download the latest release from [Hugo Releases](https://github.com/gohugoio/hugo/releases).

## Install dependencies (theme)

The theme is included as a git submodule. Clone the repository with submodules:

```bash
git clone --recurse-submodules https://github.com/mterczynski/blog
```

Or if you already cloned the repository, initialize and update the submodule:

```bash
git submodule update --init --recursive
```

## Alternative Themes

This repository includes 2 themes that work with your blog setup. Just run `./switch-theme.sh` (or `switch-theme.bat` on Windows) to switch between them!

### 1. **Ananke** (default)
- **GitHub**: [theNewDynamic/gohugo-theme-ananke](https://github.com/theNewDynamic/gohugo-theme-ananke)
- **Features**: Responsive, accessible, contact forms, custom robots.txt, good SEO
- **Best for**: General purpose blogs, professional sites
- **Demo**: https://ananke-theme.netlify.app/

### 2. **PaperMod**
- **GitHub**: [adityatelange/hugo-PaperMod](https://github.com/adityatelange/hugo-PaperMod)
- **Features**: Fast, clean, minimal design with dark mode, search, archives, social icons
- **Best for**: Technical blogs, documentation, minimalist aesthetic
- **Demo**: https://adityatelange.github.io/hugo-PaperMod/

## How to Switch Themes

**Both working themes are installed!** 

**Quick switch with the script** (recommended):
```bash
# On Linux/macOS/Git Bash:
./switch-theme.sh

# On Windows (Command Prompt):
switch-theme.bat
```

The script will:
- Show both available themes
- Display your current theme
- Let you select a new theme by number or name
- Automatically update `hugo.yaml`

**Manual switching** - Edit `hugo.yaml`:
```yaml
theme: PaperMod  # or ananke
```

**Preview themes:**
```bash
hugo server
# or override temporarily without changing config:
hugo server --theme=PaperMod
```

### Important Notes

- **Configuration**: Each theme may require different configuration options in `hugo.yaml`. Always check the theme's documentation.
- **Content structure**: Some themes expect specific front matter or content organization. You may need to adjust your posts.
- **Layouts**: Custom layouts in your site's `layouts/` directory will override theme layouts.
- **Backup**: Consider creating a new branch before switching themes to preserve your current setup.

## Running the blog locally

```bash
hugo server
```

Then open http://localhost:1313/blog

## Building the blog

```bash
hugo build
```

The static site will be generated in the `public/` directory.

## WIP Articles

Work in progress (WIP) articles are written at https://github.com/mterczynski/private-blog
