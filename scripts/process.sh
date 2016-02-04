#!/bin/bash

# cd github-city-rankings; ./merge-city.coffee
# cc ../top-github-users-data; apps/process-files.sh
# Run to recreate files
# scripts/process.sh

cp ../top-github-users-data/data/processed/aggregated-top-Spain-evol.csv data
cp ../top-github-users-data/data/user-data-España.json data
cd scripts;./process.pl > ../data/date-followers-contrib.csv
./new-users-month.pl > ../data/users-month.csv
