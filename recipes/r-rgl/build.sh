#!/bin/bash

cp /usr/lib64/libGL.so $PREFIX/lib
ln -s $PREFIX/lib/libGL.so $PREFIX/lib/libGL.so.1.2.0
ln -s $PREFIX/lib/libGL.so $PREFIX/lib/libGL.so.1

# R refuses to build packages that mark themselves as Priority: Recommended
mv DESCRIPTION DESCRIPTION.old
grep -v '^Priority: ' DESCRIPTION.old > DESCRIPTION

$R CMD INSTALL --build .

# Add more build steps here, if they are necessary.

# See
# http://docs.continuum.io/conda/build.html
# for a list of environment variables that are set during the build process.
