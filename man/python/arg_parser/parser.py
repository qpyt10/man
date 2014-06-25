#!/usr/bin/python

import argparse

parser = argparse.ArgumentParser(prog='myprogram', description='some descriptions', epilog='print this akin last line')


parser.add_argument('-f', '--foo', help='help for foo option here')
parser.add_argument('-b', '--bar', help='bar help', nargs=1)

#parser.add_argument('-c', '--cc', help='help for option here', nargs='+')

#parser.add_argument('-c', '--const', action='store_const', const=42)

args = parser.parse_args()

print args

print args.foo


