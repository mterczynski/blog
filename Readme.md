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
