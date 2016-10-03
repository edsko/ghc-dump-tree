#!/bin/bash

VERSION=0.2.0.1

##
## This builds ghc-dump-tree for a bunch of ghc versions
## It assumes that ghc is installed in /opt/ghc/$GHC_VERSION.
##

BUILDDIR=dist-newstyle/build/x86_64-linux
CPATH=c/ghc-dump-tree/build/ghc-dump-tree/ghc-dump-tree

mkdir -p bin

set -e

for GHC_VERSION in 7.4.2 7.6.3 7.8.4 7.10.3 8.0.1
do
  cabal new-build --with-ghc=/opt/ghc/$GHC_VERSION/bin/ghc

  # We create a symlink rather than copy to make it easier to manually
  # recompile using a specific ghc version
  ln -f -s ../$BUILDDIR/ghc-$GHC_VERSION/ghc-dump-tree-$VERSION/$CPATH bin/ghc-dump-tree-$GHC_VERSION
done
