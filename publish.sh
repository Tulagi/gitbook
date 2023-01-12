set -e
set -x

# branch main
gitbook install
gitbook build . docs

rm -rf ../gitbook_br_gitbook/docs/
mv docs/ ../gitbook_br_gitbook/

git pull -p
git add .
git commit -m "$(date "+%Y-%m-%d %H:%M:%S"): main branch - update source"
git push origin main:main


# branch gitbook
cd ../gitbook_br_gitbook/

rm -rf $(/usr/bin/ls | grep -vP ".git|docs")
mv docs/* .
rm -rf docs/ publish.sh

git pull -p
git add .
git commit -m "$(date "+%Y-%m-%d %H:%M:%S"): gitbook branch - publish gitbook"
git push origin gitbook:gitbook

# git branch --set-upstream-to=origin/gitbook gitbook
# https://tulagi.github.io/gitbook/
