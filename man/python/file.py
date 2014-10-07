#!/usr/bin/python

fileName='file.py'

# read a file line by line
f = open(fileName, 'r')
for line in f:
   print line
f.close()

# read a file once
f = open(fileName, 'r')
text = f.read()
print text
f.close()

# write a file
o = open('file_copied.py', 'w')
o.write("# write a copy of string.py\n")
o.write(text)
o.close()
