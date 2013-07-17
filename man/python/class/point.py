#!/usr/bin/python

class point :

   def __init__ (self, value, index=None, position=None, name=None):
      self.value = value
      if isinstance(index, int):
         self.index = index
      if isinstance(position, tuple):
         self.position = position
      if isinstance(name, str):
         self.name = name

   def __repr__ (self):
      return str(self.value)

   def __str__ (self):
      string = ''
      if hasattr(self, 'name'):
         string += self.name + " = "
      string += "%e"%(self.value)
      if hasattr(self, 'position'):
         string += "\t@ " + str(self.position)
      if hasattr(self, 'index'):
         string += " ; index = " + str(self.index)
      return string 

   def __call__ (self):
      """ __call__

      returns value of point

      Examples
      --------
      >>> x = point(1.0)
      >>> print x()
      1.0
      """
      return self.value

   def __add__ (self, other):
      """ return a point with value as sum of values
          index and position are ignored
      >>> x = point(1.0, 981)
      >>> y = point(2.0, 12)
      >>> z = x + y
      >>> print z.get_value()
      3.0
      """
      #return point(self.value + other.value, self.index, self.position)
      return point(self.value + other.value)

   def __eq__ (self, other):
      """ __eq__
      >>> x = point(1.0, 213)
      >>> y = point(1.0, 12)
      >>> x == y
      True
      >>> z = point(2.0)
      >>> x == z
      False
      """
      return self.value == other.value
   def __ne__ (self, other): return self.value != other.value
   def __lt__ (self, other): return self.value <  other.value
   def __le__ (self, other): return self.value <= other.value
   def __gt__ (self, other): return self.value >  other.value
   def __ge__ (self, other): return self.value >= other.value

   def __cmp__ (self, other):
      return cmp(self.value, other.value)

   def get_value (self):
      """ get_value()

      returns value of point

      Returns
      -------
      value : value of point obj

      Examples
      --------
      >>> x = point(1.0)
      >>> print x.get_value()
      1.0
      """
      return self.value

   def get_index (self):
      """ get_index()

      returns index, if exists, of point obj

      Examples
      --------
      >>> x = point (1.0, 156)
      >>> print x.get_index()
      156
      >>> x = point(1.0)
      >>> print x.get_index()
      None
      """
      if hasattr(self, 'index'):
         return self.index
      else:
         return

   def get_position (self):
      """ get_position() 

      returns position, if exists, of point obj

      Examples
      --------
      >>> x = point (1.0, 156, (13, 67, 91))
      >>> print x.get_position()
      (13, 67, 91)
      >>> x = point(1.0)
      >>> print x.get_position()
      None
      """
      if hasattr(self, 'position'):
         return self.position
      else:
         return


if __name__ == "__main__":
   import doctest
   doctest.testmod()


x = point(1.0)
print x.__dict__
print x
x = point(1.0, 1)
print x.__dict__
print x
x = point(1.0, 1, (1,1))
print x.__dict__
print x
x = point(1.0, 1, (1,1), 'x')
print x.__dict__
print x.get_value(), x.get_position(), x.get_index()
print x
y = point(2.0, 2, (2,2), 'y')
print y
print y.get_value(), y.get_position(), y.get_index()
z = x+y
print "x+y = ", z
print z.get_value(), z.get_position(), z.get_index()

#y = point(x.get_value())
print cmp(x, y)


class data :

   def __init__ (self):
      self.a = point(1.0, 1, (1 ,1), 'a')
      self.b = point(-1.0, 2, (2 ,2), 'b')
      self.c = point(9834.23, name='c')

   def __str__ (self):
      return str(self.max)

d = data()
print d.a
print d.b
print d.c

