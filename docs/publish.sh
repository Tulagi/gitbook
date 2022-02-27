set -e

gitbook install
gitbook build . docs
git add .
git commit -m "$(date): update gitbook"
git push origin main:gitbook
