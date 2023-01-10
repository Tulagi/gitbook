set -e
set -x

gitbook install
gitbook build . docs

mv docs/ ../gitbook_br_gitbook/

git pull -p
git add .
git commit -m "$(date): main branch - update source"
git push origin main:main

cd ../gitbook_br_gitbook/
mv docs/* .
rm -rf docs/
rm -rf publish.sh
git pull -p
git add .
git commit -m "$(date): gitbook branch - publish gitbook"
git push origin gitbook:gitbook

# git branch --set-upstream-to=origin/gitbook gitbook
