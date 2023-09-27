#!/bin/bash

## BabyApp development work flow
## start in Figma, export to Quest
## use Quest, add bindings to
##   props.post.title
##   props.post.content
##   props.post.image
## export from Quest to a new repo in github
##   use GitHub create new repo, include README file, which creates main branch
##   repo name convention: Quest-AppName-CardName, eg. Quest-BabyApp-Card2
## clone from github using Mac terminal
## add (merge?) skeletal src/App.jsx
##   defines & initializes props.post
## test as React App (runs in browser with static content)
## # npm install
## # npm start
##
## merge babyapp-vite (from github)
## what changes here? Is this a pwa? Which icons, etc?
##   changes project from React to Vite
##   changes to BabyApp: PWA deployable by WordPress
##   adds dependencies (node_modules) for Vite, PWA, BabyApps, wpapi, etc
##     should wpapi node_module be traditional, or standalone git repo?
##     can other BabyApps code be in src2 directory (as standalone git?)
##   gets content from 1st post in WordPress
## does it look like the minimal Vite + React app, or like Quest exported app?
##   icons from Quest export should take precidence over Vite + React icons
## is it useful if this repo can be checked out independently and run? (like minimal Vite + React app)
## test as Vite + React App
## # npm install - is it necessary or good idea to delete old node_modules?
## # npm run dev


#APPNAME="Quest-Babyapp-Card2"
GITHUB="https://github.com/neil-cutcliffe"

## Check usage for AppName
if [ -z "$1" ]; then echo "usage $0 appname <dirname>"; exit; fi

APPNAME=$1
DIRNAME=$APPNAME

## Check usage for optional DirName
if [ -n "$2" ]; then DIRNAME=$2; fi

## Check if dir already exists
if test -f "$DIRNAME"; then
    echo "$DIRNAME exists"
	exit
fi



## 1. Get Quest exported React project files from GitHub

git clone ${GITHUB}/${APPNAME}.git ${DIRNAME}



## 2. App doesn't work yet, needs props.post

git clone ${GITHUB}/${APPNAME}.git ${DIRNAME}-orig
cp minimal-src-App.jsx ${DIRNAME}-orig/src/App.jsx
ln -s ../src/assets ${DIRNAME}-orig/public/assets

## Print instructions
echo "To install and run"
echo " cd ${DIRNAME}-orig"
echo " npm install"
echo " npm start"



## 3. Overlay vite app

#    --exclude assets/react.svg  \
#    --exclude src/App.css   \

git clone ${GITHUB}/babyapp-vite.git babyapp-vite-orig
echo "Vite overlay"
( cd ./babyapp-vite-orig; tar cf -	\
    --exclude .git          \
    --exclude .gitignore    \
    --exclude src/index.css \
    . )                     \
    | ( cd ${DIRNAME}; tar xvfp - )


## 4. Exclude BabyApp project from this 'sandbox' git

cat << EOF >> .git/info/exclude

# Exclude BabyApp project, its a repo on its own.
${DIRNAME}
${DIRNAME}-orig
EOF

## Print instructions

echo "To install and run"
echo " cd ${DIRNAME}"
echo " npm install"
echo " npm run dev"


exit


OLD

# Neil's WPAPI components
(cd ../Neil-components; tar cf - . ) | tar xfp -

