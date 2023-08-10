#!/bin/bash 
# software-release.sh
echo "|x| Performing Software Release..."

RELEASE_AS=patch
BRANCH=release
echo "Version Bump -> Generating CHANGELOG and Software Tagging..."
standard-version --release-as $RELEASE_AS
git push --follow-tags origin $BRANCH