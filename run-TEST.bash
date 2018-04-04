#!/bin/bash

test_model() {
  echo -e "\nTest Model $1:\n"
  rake test TEST=test/models/${1}_test.rb
  [ "$?" != "0" ] && exit
}


test_model status