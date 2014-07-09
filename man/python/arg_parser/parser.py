#!/usr/bin/python

import argparse

parser = argparse.ArgumentParser(prog='myprogram', description='some descriptions', epilog='print this akin last line')


parser.add_argument('-f', '--foo', help='help for foo option here')
parser.add_argument('-b', '--bar', help='bar help', nargs=1)
parser.add_argument('optional positional args', default=[], nargs='*')
#parser.add_argument('required positional args', default=[], nargs='+')

args = parser.parse_args()

print args

