#!/bin/bash

diff -r						\
	-x .DS_Store			\
	-x .git					\
	-x .gitignore			\
	-x index.css			\
	-x node_modules			\
	-x package-lock.json	\
	babyapp-vite-orig $1   > /tmp/diff.babyapp-vite

exit

	-x react.svg			\
	-x App.css				\
