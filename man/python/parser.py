#!/usr/bin/python

import argparse

parser = argparse.ArgumentParser(description='some descriptions', epilog='last line')

parser.add_argument('-s', '--long')
#parser.add_argument('-c', '--const', action='store_const', const=42)
#parser.add_argument('arg1')

args = parser.parse_args()

print args.s


