set -e
set -x

gitbook install
gitbook build . docs

git pull -p
git add .
git commit -m "$(date): publish gitbook"
git push origin gitbook:gitbook

# git branch --set-upstream-to=origin/gitbook gitbook
