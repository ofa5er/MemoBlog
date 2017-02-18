cd ~\Desktop\MemoBlog\
cd themes\hiker
git pull
cd ..\..
git pull
hexo generate
cp -r -fo .\public\* .\production\public\
cd .\production
firebase deploy
