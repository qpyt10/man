
# initialize an empty list
empty_list = []

print empty_list

# initialize a list
l = [ 'string', 42, empty_list, 2.0, [0, 1] ]

print l

# the type of a list
print type(l)

# length of a list
print len(l)

# access elements in a list
print l[0], l[len(l)-1]

# slicing
print l[1:4]
print l[0:len(l)]
print l[2:]

# negative indices starts from the right
print l[-2]

# updating a list:
l[2] = 'replace empty list'
print l

# delete list elements
del l[4]
print l

# concatenate lists:
l1 = [0, 1, 2]
l2 = [3, 4, 5]
print l1 + l2

# membership of a list:
print 4 in l2
 

# iterate on a list
for item in l:
   print item

# iterate on a list with index
for index, item in enumerate(l):
   print index, item


# list methods:

# append to a list
l.append(42)
print l

# count occurrence of an element
print l.count(42)

# index of an element (first occurrence)
print l.index(42)

# reverse in place
l.reverse()
print l

# remove element from a list (first occurrence)
l.remove(42)
print l

# remove and return last element
print l.pop()
print l

# insert an element at index
l.insert(2, 'new')
print l

# sort a list in place
l = [5, 42, 9, 2, 3, 6]
l.sort()
print l
