#!/usr/bin/env bash
set -x
env
echo 'test'
if ([ "$TRAVIS_BRANCH" == "master" ] && [[ -z "$TRAVIS_TAG" ]]) &&
    [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  git config --global user.email "builds@travis-ci.com"
  git config --global user.name "Travis CI"
  go get -u -v github.com/screwdriver-cd/gitversion
  $GIT_TAG=$(gitversion --prefix=v bump auto 2>&1|tail -1)
  git push https://$GITHUBKEY@github.com/birgirst/test-gitversion $GIT_TAG
  echo "tagged release"
elif ([ "$TRAVIS_BRANCH" != "master" ] && [[ ! -z "$TRAVIS_TAG" ]]) &&
    [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  echo "This will not deploy"
fi
