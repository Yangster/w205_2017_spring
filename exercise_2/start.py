import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT
import sys
from subprocess import call
import os
#starts database


#full start means drops database before starting.
#full=False
#if sys.argv[1]=='full':
#	full=True
	
#if full==True:
# Connect to the database
conn = psycopg2.connect(database="postgres", user="postgres", password="pass", host="localhost", port="5432")

	#Create the Database IF Database do

try:
	# CREATE DATABASE can't run inside a transaction
	conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
	cur = conn.cursor()
	cur.execute("DROP DATABASE tcount")
	cur.execute("CREATE DATABASE tcount")
	cur.close()
	conn.close()
except:
	print "Could not create tcount"
#else:
	
    
    
conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")


cur = conn.cursor()
cur.execute('''CREATE TABLE tweetwordcount
       (word TEXT PRIMARY KEY     NOT NULL,
       count INT     NOT NULL);''')
conn.commit()
cur.close()
conn.close()


# run streamparse
#cwd=os.getcwd()
#os.chdir(cwd+'/extweetwordcount')
#can't do sparse run from python?