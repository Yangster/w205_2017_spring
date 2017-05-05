import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT
import sys
from subprocess import call
import os
#starts database


#restart means drops database before starting.

arguments=[arg.lower() for arg in sys.argv[1:]] #lower case arguments

assert set(arguments).issubset(set(['restart','run','quick'])),\
 "Arguments must be one of 'restart', 'quick', or 'restart'"


if 'restart' in arguments:
	restart = True
else:
	restart = False


#run means to run streamparse

if 'run' in arguments:
	run = True
else:
	run = False

#Quick means skip all of the database and table creation

if 'quick' in arguments:
	quick = True
else:
	quick = False


#if quick, then skip to the end
	
#if full==True:
# Connect to the database
if quick == False: #only do this if user didn't designate 'quick'
	conn = psycopg2.connect(database="postgres", 
							user="postgres", 
							password="pass", 
							host="localhost", 
							port="5432")

		#Create the Database IF Database do

	try:
		# CREATE DATABASE can't run inside a transaction
		conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
		cur = conn.cursor()
		# if user designates restart, then drop database first
		if restart == True:
			cur.execute("DROP DATABASE tcount")
		cur.execute("CREATE DATABASE tcount")
		cur.close()
		conn.close()
	except:
		print "Could not create tcount"
	#else:
	
	
	
	conn = psycopg2.connect(database="tcount", 
							user="postgres", 
							password="pass", 
							host="localhost", 
							port="5432")


	cur = conn.cursor()
	cur.execute('''CREATE TABLE tweetwordcount
		   (word TEXT PRIMARY KEY     NOT NULL,
		   count INT     NOT NULL);''')
	conn.commit()
	cur.close()
	conn.close()

if run == True:
	#run streamparse
	#change to extweetwordcount directory first
	cwd=os.getcwd()
	os.chdir(cwd+'/extweetwordcount')
	call(['sparse','run'])
	#change back to original directory?
	os.chdir(cwd)


# run streamparse
#cwd=os.getcwd()
#os.chdir(cwd+'/extweetwordcount')
#can't do sparse run from python?
