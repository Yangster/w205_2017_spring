import psycopg2
from sys import argv
from pandas import Series

#argv[0] is hte name of the script
#argv[1] would be the first argument

#print argv[2] >=argv[1]
#print argv[1] * argv[2]
min=int(argv[1])
max=int(argv[2])
assert len(argv)==3, "need two arguements"
assert (max >= min), "second argument has to be larger than first"

try:
    conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
	#conn=psycopg2.connect("dbname='tcount' user='postgres' host='localhost'")
    #connect every time
except:
    print("Cannot connect to Database")
cur=conn.cursor()

cur.execute("""SELECT word, count FROM tweetwordcount""")
records=Series(dict(cur.fetchall()))

#records.sort_values(inplace=True,ascending=True)

display_records=records[records.between(min,max)]

#print records

for word, count in display_records.iteritems():
    print word,":",count    
