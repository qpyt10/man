#!/usr/bin/python

import time

def main ():

   t = time.localtime()
   print t

   th = time.strftime("%a", t)

   format_id = "%Y%m%d"
   tid = time.strftime(format_id, t)

   format_h  = "%d/%m/%y %a"
   th  = time.strftime(format_h, t)

   print tid, th


if __name__ == "__main__":
   main()

