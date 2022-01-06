#!/usr/bin/env bash


docker build . -t test && docker run --rm -it test login -f root