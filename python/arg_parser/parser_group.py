#!/usr/bin/python

import argparse

parser = argparse.ArgumentParser(prog='myprogram', description='subparser example')

group = parser.add_argument_group('group')

group.add_argument('--foo', help='foo help')

group2 = parser.add_argument_group('group 2')

group2.add_argument('--bar', help='foo help')

args = parser.parse_args()

print args

