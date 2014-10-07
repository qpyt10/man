#!/usr/bin/python

import argparse

parser = argparse.ArgumentParser(prog='myprogram', description='subparser example')

subparsers = parser.add_subparsers()

parser_a = subparsers.add_parser('a', help='a help')
parser_a.add_argument('-f', type=int, help='f help')

parser_b = subparsers.add_parser('b', help='a help')
parser_b.add_argument('-g', type=int, help='g help')
parser_b.add_argument('-f', type=int, help='f help')

args = parser.parse_args()

print args

#args_a = parser.parse_args('a')
#args_b = parser.parse_args('b')
#
#print "args a : ", args_a
#print "args b : ", args_b
