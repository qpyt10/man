#!/usr/bin/python
import sys
import re

import inspect

interactive = False
interactive = True

# debug {{{
def dbg_stack ():
   # stack
   #print "[DBG_STCK] stack", inspect.stack()[2][3]
   _, filename, linenumber, _, _, _ = inspect.stack()[2]
   print "[DBG_STCK] Called from %s @%d" % (filename, linenumber)
# }}}

# str_python {{{
class str_python (str):

   def is_blank (self):
      return not self.strip()

   def is_comment (self):
      return bool(re.match("#", self))

   def is_comment_double (self):
      return bool(re.match("##", self))

   def is_code (self):
      return (not self.is_blank()) and (not self.is_comment())

   def indent (self):
      # if s is blank set indent to 0
      if (self.is_blank()):
         return 0
      else:
         return len(self) - len(self.lstrip())

   def __add__ (self, other):
      s = super(str_python, self).__str__() 
      o = super(str_python, other).__str__()
      return str_python(s+o)

#   def __repr__ (self):
#      return self

   def __str__ (self):

      #dbg_stack()
   
      s = ""

      if ( self.is_code() ):
         l = self.split("\n")
         for i in l:
            s += ">>> " + i + "\n"
         s = s[:-1]
      else:
         s += self

      # remove first comment for double comment lines
      if ( self.is_comment_double() ):
         s = s[1:]

      d = str_python(s)
      if ( d.is_comment() and not s[1:] ):
         return '\033[1A'

      return s

# }}}

# class Report {{{

class Report ():

   def __init__ (self, file_name = 'test.py'):

      self.file   = file_name
      self.lines  = self.get_lines()
      self.blocks = self.get_blocks()

# get_lines {{{
   def get_lines (self):
      return [ str_python( line[:-1].rstrip() ) for line in open(self.file) ]
# }}}
   # get_blocks {{{
   def get_blocks (self):
      """ return list with blocks """
      b = []
      indent_start = 0
      s = str_python("")
      # preprocess lines for block
      for i, line in enumerate(self.lines):
   
         indent_curr = line.indent()
         # pay attention to last line
         if (len(self.lines) > i+1) :
            indent_next = self.lines[i+1].indent()
         else:
            indent_next = 0
   
         s += line
      
         if (indent_next > indent_start):
            s += str_python("\n")
         else:
            indent_start = indent_next
            b.append(s)
            s = str_python("")
   
      return b
# }}}

   def exe (self):

      line_previous = str_python("")

      # loop on blocks
      for i, line in enumerate(self.blocks):

         print line

         if ( line_previous.is_comment_double() ):
            exec "print " + line
         else:
            exec line

         if (line.is_code()):
            if (interactive):
               self.wait_for_key()

         line_previous = line


   def wait_for_key(self):
      #import tkMessageBox as tkmb
      #tkmb.showinfo("Alert", "Press OK to continue")
      raw_input()

# }}}


def main ():

   #files = ['test.py']
   files = ['list.py']
   
   
   if ( len(sys.argv)-1 ):
      files = sys.argv[1:]
   
   #print "Files : ", files
   
   for i, item in enumerate(files): 
   
      rep = Report(item)
   
      # executing file
      rep.exe()



if __name__ == "__main__":
   import doctest
   doctest.testmod()
   main()
