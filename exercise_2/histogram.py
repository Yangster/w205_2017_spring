import psycopg2
from sys import argv
from pandas import Series

#argv[0] is hte name of the script
#argv[1] would be the first argument


assert len(argv)==3, "need two arguements"
assert argv[2]>=argv[1]

try:
    conn = psycopg2.connect(database="tcount", user="postgres", host="localhost", port="5432")
	#conn=psycopg2.connect("dbname='tcount' user='postgres' host='localhost'")
    #connect every time
except:
    print("Cannot connect to Database")
cur=conn.cursor()

cur.execute("""SELECT word, count FROM tweetwordcount""")
records=Series(cur.fetchall())

min =argv[1]
max=argv[2]

records.sort_values(inplace=True,ascending=True)

display_records=records[record.between(min,max)]

for record in display_records:
	print record
