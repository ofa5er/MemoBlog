cd ~\Desktop\MemoBlog\
cd themes\hiker
git pull
cd ..\..
git pull
hexo generate
cp -r -fo .\public\* .\production\public\
cd .\production
npm install -g firebase-tools
firebase deploy
