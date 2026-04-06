# 1. Rebuild
rm -rf .vitepress/dist
rm -rf .vitepress/cache
npm run build
# 2. Update build in ../mterczynski.github.io
rm -rf ../mterczynski.github.io/vitepress
mkdir ../mterczynski.github.io/vitepress
cp -r ./.vitepress/dist/* ../mterczynski.github.io/vitepress/
cd ../mterczynski.github.io

#3. Commit in ../mterczynski.github.io
git add vitepress;
git commit -m "Update blog: $(git log -1 --pretty=format:"%s")"

# 4. Push in ../mterczynski.github.io
git push
