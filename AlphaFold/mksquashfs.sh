#!/bin/bash
#===============================================================================
#
#          FILE:  mksquashfs.sh
# 
#         USAGE:  ./mksquashfs.sh
# 
#   DESCRIPTION:  Script used to create a squashFS
# 
#        AUTHOR:  Adam Michaleas, Adam.Michaleas@ll.mit.edu
#       COMPANY:  MIT Lincoln Laboratory
#       VERSION:  1.0
#       CREATED:  06/27/2023 09:16:12 AM EST
#      REVISION:  ---
#===============================================================================

case "$1" in
'create-squashfs')

mksquashfs $2 $3

;;

*)
echo "";
echo "Usage: $0 <OPTION>"
echo "Example: ./mksquashfs.sh create-squashfs $PATH_TO_FS $SQUASHFS_NAME.fs"
echo "";
echo "Supported Options:"
echo "------------------"
echo "";
echo "create-squashfs: Create a squashfs file for use by first providing a path to the filesystem and then the name of the squashFS that you want to set (ex. mksquashfs.sh create-squashfs /testdata/ testdata.fs)"
echo "";

;;
esac
