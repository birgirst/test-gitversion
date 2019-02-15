#!/usr/bin/env bash
set -x
env
echo 'test'
if ([ "$TRAVIS_BRANCH" == "master" ] && [[ -z "$TRAVIS_TAG" ]]) &&
    [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  echo "This will deploy"
elif ([ "$TRAVIS_BRANCH" != "master" ] && [[ ! -z "$TRAVIS_TAG" ]]) &&
    [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  echo "This will not deploy"
fi
