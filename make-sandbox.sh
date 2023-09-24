#!/bin/bash

## BabyApp development work flow
## start in Figma, export to Quest
## in Quest, add bindings to
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
## merge vite-app (from github)
## what changes here? Is this a pwa? Which icons, etc?
##   changes project from React to Vite
##   changes to BabyApp: PWA deployable by WordPress
##   adds dependencies (node_modules) for Vite, PWA, BabyApps, wpapi, etc
##     should wpapi node_module be traditional, or standalone git repo?
##     can other BabyApps code be in src2 directory (as standalone git?)
##   gets content from 1st post in WordPress
## does it look like the minimal Vite + React app, or like Quest exported app?
##   icons from Quest export should take precidence over Vite + React icons
## is it useful if this repo can be checked out independently and run? (like minimal Vitre + Reach app)
## test as Vite + React App
## # npm install - is it necessary or good idea to delete old node_modules?
## # npm run dev
## save current work
## # git commit

#APPNAME="Quest-Babyapp-Card2"
GITHUB="https://github.com/neil-cutcliffe"

## Check usage for AppName
if [ -z "$1" ]; then echo "usage $0 appname <dirname>"; exit; fi

APPNAME=$1
DIRNAME=$APPNAME
echo $APPNAME $DIRNAME

## Check usage for optional DirName
if [ -n "$2" ]; then DIRNAME=$2; fi
echo $APPNAME $DIRNAME

## Check if dir already exists
if test -f "$DIRNAME"; then
    echo "$DIRNAME exists"
	exit
fi



## 1. Get Quest exported React project files from GitHub
git clone ${GITHUB}/${APPNAME}.git ${DIRNAME}



## 2. App doesn't work yet, needs props.post

#cd ${APPNAME}
#(cd ../../Neil-quest; tar cvf - 	\
#    ./src/App.jsx )				\
#	| tar xfp -

## App works 
#npm install
#npm start

# git init
# git add
# git commit

#cd ../
#exit


# 3. Minimal vite app
git clone ${GITHUB}/babyapp-vite.git babyapp-vite-orig
cd ${DIRNAME}
(cd ../babyapp-vite-orig; tar cf -	\
    --exclude .git          \
    --exclude .gitignore    \
    --exclude src/index.css \
    --exclude src/App.css   \
    --exclude assets/react.svg  \
    . )                     \
    | tar xfp -

## App works 
#npm install
#npm run dev

exit





OLD


# Minimal vite app
(cd ../vite-app; tar cf -	\
    --exclude src/index.css \
    --exclude src/App.css   \
    --exclude assets/react.svg  \
    . )                     \
    | tar xfp -

# Neil's WPAPI components
(cd ../Neil-components; tar cf - . ) | tar xfp -

# Neil's App for Card2
# put blended package.json here
(cd ../Neil-app; tar cf - . ) | tar xfp -

cd ../

# Compare for now
diff -r -x .DS_Store -x .git -x node_modules -x package-lock.json $1- $1 > /tmp/diff.$1

# Instructions to install and run
echo "cd $1"
echo "npm install"
echo "npm run dev"

exit

## Notes

## To create vite-app
# npm create vite@latest
# Need to install the following packages:
#   create-vite@latest
# Ok to proceed? (y) y
# ✔ Project name: … vite-app
# ✔ Select a framework: › React
# ✔ Select a variant: › JavaScript
#
## Add vite-plugin-svgr to vite.config.js
