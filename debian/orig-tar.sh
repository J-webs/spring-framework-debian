#!/bin/sh -e

# called by uscan with '--upstream-version' <version> <file>
VERSION=$2
DIR=libspring-java-$VERSION
TAR=../libspring-java_$VERSION.RELEASE.orig.tar.xz
TAG="v$VERSION.RELEASE"

git clone https://github.com/spring-projects/spring-framework.git $DIR
cd $DIR
git checkout tags/$TAG
cd ..
rm -rf $DIR/.git

XZ_OPT=--best tar -c -J -f $TAR -X debian/orig-tar.exclude $DIR
rm -rf $DIR $3

exit 0
