#!/usr/bin/python

x = 0
#x = int(raw_input("select a number : "))

if x < 0:
   print "x < 0 :", x
elif x > 0:
   print "x > 0 :", x
else:
   print "x = 0 :", x


x = [1, 2, 3, 4, 5]
for i in x:
   print i, 
print

print "range(5) =", range(5)
print "range(0, 5, 1) =", range(0, 5, 1)
