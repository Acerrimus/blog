#!/bin/sh

set -ex

cd "$(dirname "${0}")"

[ -d public ] && rm -rf public
hugo --gc --minify
# hugo sometimes creates empty directories, get rid of them
find public -type d -empty -exec rmdir {} + 2> /dev/null
tar -C public -cvz . > site.tar.gz