#!/bin/bash
#
# To support a build script that might need either the base repository URL
# or the highest file revision, this script will use the repository URL of the file
# (placed by the subversion program) and the external program "svnversion"
# to determine the information.
#
# The URL and the revision, separated by a vertical bar, are echoed to stdout.
#
# The revision is the HIGHEST revision, exclusive of modifiers such as the "M"
# flag (see the manual page for svnversion for details).
#
# This script must be committed to the repository with the SVN property
# "svn:keywords" set to include "HeadURL" in the list of keywords
#
FILEURL="$URL: https://svn.code.sf.net/p/opensong/code/source/trunk/svndata.sh $"
IAM="$(basename ${0}) $"
REPO="${FILEURL##$URL: }"
REPO="${REPO%%${IAM}}"
REPO="${REPO%%/}"
# Hide username in ssh URIs
REPO=$(echo "${REPO}" | sed -e "s/\/\/.*@/\/\/xxxx@/")
#echo "${REPO}"
SVNVERS="$(svnversion)"
SVNVERS="$(echo ${SVNVERS##*:}|tr -d [A-Z])"
echo "${REPO}|${SVNVERS}"
