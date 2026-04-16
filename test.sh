#!/bin/bash

echo "Running Tests..."

if [ -f app.js ]; then
  echo "app.js exists"
else
  echo "app.js missing"; exit 1
fi

if [ -f index.html ]; then
  echo "index.html exists"
else
  echo "index.html missing"; exit 1
fi

echo "All tests passed!"
