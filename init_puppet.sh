#!/usr/bin/env sh

apt-get update
apt-get install -y puppet nodejs libsqlite3-dev
{ puppet module list | grep jdowning-rbenv > /dev/null; } || puppet module install jdowning-rbenv