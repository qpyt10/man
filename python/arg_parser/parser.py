#!/usr/bin/python

import argparse

parser = argparse.ArgumentParser(prog='myprogram', description='some descriptions', epilog='print this akin last line')


parser.add_argument('-f', '--foo', help='help for foo option here')
parser.add_argument('-b', '--bar', help='bar help', nargs=1)
parser.add_argument('optional positional args', default=[], nargs='*')
#parser.add_argument('required positional args', default=[], nargs='+')

# bool argument
parser.add_argument('-t', action='store_true', help="default false, store true when selected")


# mutually exclusive options
group = parser.add_mutually_exclusive_group()
group.add_argument('-x', action='store_true')
group.add_argument('-y', action='store_true')

# mutually exclusive options with default value
group2 = parser.add_mutually_exclusive_group()
parser.set_defaults(mutex='on')
group2.add_argument('--on', action='store_const', dest='mutex', const='on')
group2.add_argument('--off', action='store_const', dest='mutex', const='off')


args = parser.parse_args()

print args

print type(args)

