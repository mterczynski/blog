# 1. Rebuild
rm -rf ./_site
rm -rf ./.jekyll-cache
bundle exec jekyll build
# 2. Update build in ../mterczynski.github.io
rm -rf ../mterczynski.github.io/blog
mkdir ../mterczynski.github.io/blog
cp -r ./_site/* ../mterczynski.github.io/blog/
cd ../mterczynski.github.io/blog
# rm -rf ../mterczynski.github.io/index.html
# cp ./index.html ../mterczynski.github.io/
# cp -r ./assets ../mterczynski.github.io/
# cd ../mterczynski.github.io/pattern-generators/
3. Commit in ../mterczynski.github.io
git commit -a -m "Update blog: $(git log -1 --pretty=format:"%s")"
# git status
# 4. Push in ../mterczynski.github.io
# git push
