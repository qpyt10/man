#!/usr/bin/python
import sys
import sqlite3

# record in a database


#cur.execute('SELECT SQLITE_VERSION()')
#data = cur.fetchone()
#
#print "SQLite version: %s" % data
#
con = sqlite3.connect('test.db')
with con:
   cur = con.cursor()    
   cur.execute("CREATE TABLE Names(Name TEXT, Value FLOAT)")
   cur.execute("INSERT INTO Names VALUES('Audi',52642)")
   cur.execute("INSERT INTO Names VALUES('Mercedes',52643)")
   cur.execute("INSERT INTO Names VALUES('Skoda',9000)")
   cur.execute("INSERT INTO Names VALUES('Volvo',29000)")
   cur.execute("INSERT INTO Names VALUES('Bentley',350000)")
   cur.execute("INSERT INTO Names VALUES('Citroen',21000)")
   cur.execute("INSERT INTO Names VALUES('Hummer',41400)")
   cur.execute("INSERT INTO Names VALUES('Volkswagen',21600)")

with con:
   cur.execute("SELECT * FROM Names")
   rows = cur.fetchall()
  
   for row in rows:
      print row

with con:
   cur.execute("UPDATE Cars SET Value=? WHERE Name=?", (-10, 'Audi')) 
