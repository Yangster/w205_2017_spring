from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt
import psycopg2




class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()

    def process(self, tup):
        word = tup.values[0]

        # Write codes to increment the word count in Postgres
        # Use psycopg to interact with Postgres
        
        # feel like I'm missing something big here
        
        
        #first, connect with database Tcount
        try:
        	conn = psycopg2.connect(database="tcount", user="postgres",password="pass", host="localhost", port="5432")
			#conn=psycopg2.connect("dbname='tcount' user='postgres' host='localhost'")
        	#connect every time
        except:
        	print("Cannot connect to Database")
        cur=conn.cursor()
        
        #find out with word is in database of words
        try:
        	cur.execute("""SELECT word FROM tweetwordcount""")
        except:
        	print("Cannot query table")
        wordlist=[i[0] for i in cur.fetchall()]
        
        
        #If word is not already in table, then insert it, otherwise, increment
        
        if word in wordlist:
        	try:
        		cur.execute("""UPDATE tweetwordcount SET count=count+1 WHERE word =(%s)""",[word])
        		conn.commit()
        	except:
        		print('Cannot update count')
        else:
        	try:
        		cur.execute("""INSERT INTO tweetwordcount(word,count) VALUES((%s),1)""",[word])
        		conn.commit()
        	except:
        		print('cannot add new word')
        #cur.close()		
        #conn.close()
        #cur.execute("""COMMIT""")
        	
        # Database name: Tcount 
        # Table name: Tweetwordcount 
        # you need to create both the database and the table in advance.
        
        
        

        # Increment the local count
        self.counts[word] += 1
        self.emit([word, self.counts[word]])

        # Log the count - just to see the topology running
        self.log('%s: %d' % (word, self.counts[word]))
