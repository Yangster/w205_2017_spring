Exercise 2

Dependencies: psycopg2 v 2.6.2, pandas, os, subprocess, tweepy, streamparse, sys

This application can be run by the three python scripts: start.py, finalresults.py, and
histogram.py

First make sure the extweetwordcount directory is in the same directory as the three
python scripts. This directory should contain a clojure topology in the topologies 
folder and bolts and spouts in the src folder.

run python start.py to create the database, 'tcount' and the data table 'Tweetwordcount'.

If for some reason you want to clear the database and restart, use the argument 'restart'

If you want to also start the stream, add the argument 'run'

If you've already created the database, and don't with to restart, then add the argument
'quick'

arguments can be given in any order.

For example, to start a new database wand run the stream, use >python start.py run
to clear the database, use >python start.py restart. And if you wanted to clear the 
database and run the stream, use >python start.py restart run. And if the stream was stopped
and you would like to start it again without clearing the database, run 
>python start.py quick run 

To stop the stream press ctrl+c.


To view results, you can open the postgres database using >psql -U postgres 
and the >\c tcount;
Or use one of the two serving scripts, finalresults.py or histogram.py

finalresults.py will give the count of the word you put after it as a command line argument.
if no arguments are given, then it will display the count of every word in the database.

Histogram.py will display the word and count of every word that has a count between the 
two command line arguments, which have to be given as numbers.
