#!/usr/bin/python

alist = ['this is a list ', 1, 3.14, 'name']

print alist
print "alist[0] = ", alist[0]
print "alist[1:3] = ", alist[1:3]
print "len(alist) = ", len(alist)


l = []
print l
l.append(1)
l.append(2)
print l

l1 = [1, 2, 3]
l2 = [4, 5, 6]

m = [l1, l2]
print m

Team1 = ["Red", 10]
Team2 = ["Green", 5]
Team3 = ["Blue", 6]
Team4 = ["Yellow", 8]
Team5 = ["Purple", 9]
Team6 = ["Brown", 4]

TeamList = [Team1, Team2, Team3, Team4, Team5, Team6]

# print the top row of team names, tab separated, starting two tabs over:
print ' '.join(team[0] for team in TeamList)

for team in TeamList:
   print team[0]

n = []
day = ["mon", 1]
n.append(day)
day = ["tue", 2]
n.append(day)
print n
for jj in n:
   print jj[0]

#print day.index(2)

print
print n
print n[0][:]

allday = [ i[0] for i in n ]
print allday
