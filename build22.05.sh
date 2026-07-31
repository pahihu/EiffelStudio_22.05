#!/bin/bash
./make_clean
./compile_exes macosx-armv6 2>&1 | tee my_compile_exes.log
if [ -d Eiffel_22.05 ];
then
  cp estudio22-env.sh Eiffel_22.05/
  ./make_images macosx-armv6
  exit 0
else
  echo "ERROR: directory Eiffel_22.05 not found"
  exit 1
fi
