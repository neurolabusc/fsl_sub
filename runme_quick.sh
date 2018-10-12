#!/bin/bash

pushd `dirname $0` > /dev/null
SCRIPTPATH=`pwd -P`
popd > /dev/null
BEDPOSTDIR=$SCRIPTPATH/bedpost
BEDPOSTOUTDIR=$BEDPOSTDIR.bedpostX

rm -rf $BEDPOSTOUTDIR
echo "fsl_sub running $COMMANDNAME with parallel processing disabled"
FSLPARALLEL=0; export FSLPARALLEL
#time bedpostx $BEDPOSTDIR

rm -rf $BEDPOSTOUTDIR
echo "fsl_sub running $COMMANDNAME with parallel processing enabled"
FSLPARALLEL=1; export FSLPARALLEL
time bedpostx $BEDPOSTDIR



