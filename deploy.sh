# 1. Rebuild
rm -rf ./dist
npm install
npm run build
# 2. Update build in ../mterczynski.github.io
rm -rf ../mterczynski.github.io/blog
mkdir ../mterczynski.github.io/blog
cp -r ./dist/* ../mterczynski.github.io/blog/
cd ../mterczynski.github.io/blog
# 3. Commit in ../mterczynski.github.io
git commit -a -m "Update blog: $(git log -1 --pretty=format:"%s")"
# git status
# 4. Push in ../mterczynski.github.io
# git push
