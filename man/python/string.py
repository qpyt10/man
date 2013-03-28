#!/bin/python

string = "this is a string"
print string

# read a file line by line
#f = open('string.py', 'r')
#for line in f:
#   print line
#f.close()

# read a file once
f = open('string.py', 'r')
text = f.read()
print text
f.close()

# write a file
o = open('string_copied.py', 'w')
o.write("# write a copy of string.py\n")
o.write(text)
o.close()
