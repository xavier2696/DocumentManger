#!/bin/bash

[ -s db/development.sqlite3 ] || rake db:setup
[ "$?" == "0" ] && rails s

