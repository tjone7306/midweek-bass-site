#!/bin/bash
# Double-click this file from Finder to deploy.
cd "$(dirname "$0")"
echo "Deploying Midweek Bass Anglers to Firebase..."
echo
firebase deploy --only hosting
echo
echo "Done. Press any key to close this window."
read -n 1
