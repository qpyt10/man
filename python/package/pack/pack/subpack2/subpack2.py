
import pack.subpack.subpack as subpack

def m_sub_pack2():
   return "method from sub_pack2"

class sub_pack2(subpack.sub_pack):
   def __init__(self):
      print "init from sub_pack2"
