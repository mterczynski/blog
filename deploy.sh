# 1. Rebuild
rm -rf .vitepress/dist
rm -rf .vitepress/cache
npm run build
# 2. Update build in ../mterczynski.github.io
rm -rf ../mterczynski.github.io/blog
mkdir ../mterczynski.github.io/blog
cp -r ./.vitepress/dist/* ../mterczynski.github.io/blog/
cd ../mterczynski.github.io/blog

#3. Commit in ../mterczynski.github.io
git commit -a -m "Update blog: $(git log -1 --pretty=format:"%s")"

# 4. Push in ../mterczynski.github.io
git push