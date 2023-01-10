set -e
set -x

# branch main
gitbook install
gitbook build . docs

rm -rf ../gitbook_br_gitbook/docs/
mv docs/ ../gitbook_br_gitbook/

git pull -p
git add .
git commit -m "$(date): main branch - update source"
git push origin main:main


# branch gitbook
cd ../gitbook_br_gitbook/

ls | grep -v "docs/" | xargs rm -rf
# mv docs/* .
# rm -rf docs/ publish.sh

# git pull -p
# git add .
# git commit -m "$(date): gitbook branch - publish gitbook"
# git push origin gitbook:gitbook

# git branch --set-upstream-to=origin/gitbook gitbook
# https://tulagi.github.io/gitbook/
