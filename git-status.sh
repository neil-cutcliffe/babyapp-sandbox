#!/bin/bash

echo Sandbox
git status
echo

echo babyapp-vite-orig
( cd babyapp-vite-orig; git status )
echo

echo $1
( cd $1; git status )
echo

echo $1/node-ba-api
( cd $1/node-ba-api; git status )
echo
