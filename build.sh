#!/usr/bin/env bash
# Fetch the latest version of the library
fetch() {
if [ -f "clove-unit.h" ]; then return; fi
URL="https://github.com/fdefelici/clove-unit/raw/refs/heads/master/clove-unit.h"
FILE="clove-unit.h"

# Download the release
echo "Downloading $FILE from $URL ..."
curl -L "$URL" -o "$FILE"
echo ""
}


# Test the project
test() {
echo "Running 01-test-suite.c ..."
clang -I. -o 01.exe examples/01-test-suite.c  && ./01.exe && echo -e "\n"
echo "Running 02-test-suite.c ..."
clang -I. -o 02.exe examples/02-test-suite.c  && ./02.exe && echo -e "\n"
echo "Running 03-test-suite.c ..."
clang -I. -o 03.exe examples/03-test-suite.c  && ./03.exe && echo -e "\n"
}


# Main script
if [[ "$1" == "test" ]]; then test
elif [[ "$1" == "fetch" ]]; then fetch
else echo "Usage: $0 {fetch|test}"; fi
