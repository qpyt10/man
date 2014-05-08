
import subpack.subpack as subpack

def m_pack():
    return "method from pack"

class Pack():
   def __init__ (self):
      print "init from Pack"

class Pack2(subpack.sub_pack):
   def __init__ (self):
      print "init from Pack2"
