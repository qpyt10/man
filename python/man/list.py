
# initialize an empty list
empty_list = []
##
empty_list

# initialize a list
l = [ 'string', 42, [], 2.0, [0, 1] ]
##
l

## the type of a list
type(l)

## length of a list
len(l)

## access elements in a list
l[0]
##
l[len(l)-1]

## slicing
l[1:4]
##
l[0:len(l)]
##
l[2:]

## negative indices starts from the right
l[-2]

# updating a list:
l[2] = 'replace 3rd element'
##
l

# delete list elements
del l[4]
##
l

# concatenate lists:
l1 = [0, 1, 2]
l2 = [3, 4, 5]
##
l1 + l2

## membership of a list:
4 in l1
##
4 in l2
 

# iterate on a list
for item in l:
   print item

# iterate on a list with index
for index, item in enumerate(l):
   print index, item


# list methods:

# append to a list
l.append(42)
##
l

## count occurrence of an element
l.count(42)

## index of an element (first occurrence)
l.index(42)

# reverse in place
l.reverse()
##
l

# remove element from a list (first occurrence)
l.remove(42)
##
l

## remove and return last element
l.pop()
##
l

# insert an element at index
l.insert(2, 'new')
##
l

# sort a list in place
l = [5, 42, 9, 2, 3, 6]
l.sort()
##
l
