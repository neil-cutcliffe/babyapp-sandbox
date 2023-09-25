#!/bin/bash

diff -r						\
	-x .DS_Store			\
	-x .git					\
	-x .gitignore			\
	-x src/index.css		\
	-x src/App.css			\
	-x assets/react.svg		\
	-x node_modules			\
	-x package-lock.json	\
	./babyapp-vite-orig ./$1 > /tmp/diff.babyapp-vite
