#!/usr/bin/python

import datetime

def main ():

   # datetime

   d = datetime.datetime.today()
   print type(d)
   print d
   print d.strftime("%Y%m%d")

   # init datetime
   dt1 = datetime.datetime(2011, 12, 25, 12, 00)
   print dt1

   # print with format
   fmt = "%Y%m%d"
   print dt1.strftime(fmt)

   # read from format
   dt2 = datetime.datetime.strptime("20121224", fmt)

   print "dt2 = ", dt2

   dt3 = datetime.datetime(2012, 12, 24, 9, 16, 42)

   print "dt3 = ", dt3

   # differnce
   print " dt3 - dt2 = ", dt3-dt2
   print " dt2 - dt3 = ", dt2-dt3


   # only time

   t1 = datetime.time(23, 32, 15)

   print t1

   t2 = datetime.datetime.strptime("23:17:42", "%H:%M:%S").time()

   print type(t2)
   print t2


   # only date

   d1 = datetime.date.today()

   print d1

   # read data from format
   d2 = dt1.strptime("19871223", "%Y%m%d").date()

   print d2

   # difference
   print d2 - d1
   print d1 - d2



if __name__ == "__main__":
   main()

