mdlist=`find ~/qz757.github.com/blogdata/ -name "*.md"`
mds=""
for md in $mdlist
do
mds=$mds,$md
done
echo $mds
if [[ $mds =~ .*,.* ]]
then
echo "publish to blogdata"
cp blogdata/*.md ~/blogdata/
cd ~/blogdata
git add -A
git commit -m "auto publish"$mds
git push
echo "publish to web"
cd ~/qz757.github.com
mv blogdata/*.md source/_posts/
git add -A
git commit -m "auto publish"$mds
git push origin hexo
else
echo "no need to publish"
fi
cd
