cd newblog
path=`pwd`
token=$1
gitpath=$2
mdlist=`find ./ -name "*.md"`
mds=""
for md in $mdlist
do
mds=$mds,$md
done
echo $mds
echo "$mds"|grep -q "md"
if [ $? -eq 0 ]
then
echo "publish to blogdata"
cd ..
cd ..
git clone "https://${token}@${gitpath}"
cd qz757.github.com
mv $path/*.md source/_posts/
git add -A
git commit -m "auto publish"$mds
git push "https://${token}@${gitpath}" hexo:hexo
echo "publish to web"
fi
