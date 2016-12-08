cd newblog
path=`pwd`
token=$1
gitpath=$2
cd ..
git clone "https://${token}@${gitpath}"
cd qz757.github.com
mv $path/*.md source/_posts/
git add -A
git commit -m "auto publish"$mds
git push "https://${token}@${gitpath}" hexo:hexo
echo "publish to web"
