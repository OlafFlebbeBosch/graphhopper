#!/bin/bash

killall java 2>/dev/null

{ time java -Ddw.graphhopper.datareader.file=$HOME/Downloads/tuebingen-regbez-260131.osm.pbf -jar web/target/graphhopper-web-12.0-SNAPSHOT.jar server config-example.yml > /dev/null & }
gh=$!
sleep 5;

for i in 0 1 2 3 4 5 6 7 8 9 ; do
  for j in 0 1 2 3 4 5 6 7 8 9; do
     curl -d @One.txt  http://localhost:8989/coord?profile=bike -o /dev/null -s 
  done;
done ;
killall  java

{ time java -Ddw.graphhopper.datareader.file=$HOME/Downloads/baden-wuerttemberg-latest.osm.pbf -jar web/target/graphhopper-web-12.0-SNAPSHOT.jar server config-example.yml > /dev/null & }
gh=$!
sleep 5;

for i in 0 1 2 3 4 5 6 7 8 9 ; do
  for j in 0 1 2 3 4 5 6 7 8 9; do
     curl --data-binary @One.gpx -H"Content-Type: application/gpx+xml"  http://localhost:8989/match?profile=bike -o /dev/null -s 
  done;
done ;

killall java



