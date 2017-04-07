import psycopg2
from sys import argv
#from pandas import Series

#argv[0] is hte name of the script
#argv[1] would be the first argument


assert len(argv)>=1, "Too many arguments!"

try:
    conn = psycopg2.connect(database="tcount", user="postgres", host="localhost", port="5432")
	#conn=psycopg2.connect("dbname='tcount' user='postgres' host='localhost'")
    #connect every time
except:
    print("Cannot connect to Database")
cur=conn.cursor()

cur.execute("""SELECT word, count FROM tweetwordcount""")
records=dict(cur.fetchall())

if len(argv)==2:
	if argv[1] in records.keys():
		print "Total number of occurences of '%s': %d " % (argv[1], records[argv[1]])
	else:
		print "Total number of occurences of '%s': 0 " % argv[1]
else:
	for key in sorted(records.keys()):
		print "Total number of occurences of '%s': %d " % (key, records[key])
	

