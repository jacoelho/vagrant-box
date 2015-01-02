#!/bin/bash -eux

curl -s http://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc | apt-key add -

echo "deb http://packages.erlang-solutions.com/ubuntu $(lsb_release -cs) contrib" > /etc/apt/sources.list.d/erlang.list

apt-get update -qq

apt-get install esl-erlang elixir -y

