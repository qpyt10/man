#!/usr/bin/python
import sys
import re

# str_python {{{
class str_python (str):

   def is_blank(self):
      return not self.strip()

   def is_comment (self):
      return bool(re.match("#", self))

   def is_code (self):
      return (not self.is_blank()) and (not self.is_comment())

   def indent (self):
      # if s is blank set indent to 0
      if (self.is_blank()):
         return 0
      else:
         return len(self) - len(self.lstrip())

   def __add__ (self, other):
      return str_python(str(self)+str(other))

   def __repr__ (self):

      s = str_python("")
      if ( self.is_code() ):
         ll = self.split("\n")
         for i in ll:
            s += ">>> " + i + "\n"
         s = s[:-1]
      else:
         s += self

      return s

# }}}

# class Report {{{

class Report ():

   def __init__ (self, file_name = 'test.py'):

      self.file   = file_name
      self.lines  = self.get_lines()
      self.blocks = self.get_blocks()

   def get_lines (self):
      return [ str_python( line[:-1].rstrip() ) for line in open(self.file) ]

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
            s += "\n"
         else:
            indent_start = indent_next
            b.append(s)
            s = str_python("")
   
      return b
# }}}

   def write (self, this_line):

      if ( this_line.is_comment() or this_line.is_blank() ):
         print this_line
      else:
         ll = this_line.split("\n")
         for i in ll:
            print ">>>", i


   def exe (self, exec_this):
      print "----", exec_this
      exec exec_this

   def exe (self):
      for i, line in enumerate(self.blocks):

         #self.write(line)
         print line.__repr__()
         exec line

         if (line.is_code()):
            self.wait_for_key()

   def wait_for_key(self):
      #import tkMessageBox as tkmb
      #tkmb.showinfo("Alert", "Press OK to continue")
      raw_input()

# }}}

#files = ['test.py']

files = ['list.py']

#for i, line in enumerate(t.blocks):
#   t.write(line)
#   #t.exe(line)
#   exec line



num_files = len(sys.argv)-1

if (num_files):
   files = sys.argv[1:]

print "Files : ", files

for i, item in enumerate(files): 

   rep = Report(item)

   # executing file
   rep.exe()
