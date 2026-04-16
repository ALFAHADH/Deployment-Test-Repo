#!/bin/bash

echo "Running tests..."

if [ -f index.html ]; then
  echo " index.html exists"
else
  echo " index.html missing"
  exit 1
fi

if [ -f style.css ]; then
  echo " style.css exists"
else
  echo " style.css missing"
  exit 1
fi

echo "All tests passed "
