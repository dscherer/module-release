#!/bin/bash
# Generates a Puppetfile for librarian-puppet based on a single input file containing a list
#  of repositories.  The script will fetch the latest commit id and use that as the required version.

echo "forge \"http://forge.puppetlabs.com\"" >> Puppetfile

while read p; do
    id=`git ls-remote $p | head -1 | cut -f 1`
    shortname=`echo $p | rev | cut -d / -f 1 | rev | cut -d . -f 1 | cut -d - -f 2-`
    echo "mod \"$shortname\"," >> Puppetfile
    echo "  :git => \"$p\"," >> Puppetfile
    echo "  :ref => \"$id\"" >> Puppetfile
    echo "" >> Puppetfile
done < $1
