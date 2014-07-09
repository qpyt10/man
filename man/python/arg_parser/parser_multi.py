#!/usr/bin/python
import argparse

parser1 = argparse.ArgumentParser(prog='prog1', description='pars1')
parser1.add_argument('-f', '--foo', help='help for foo option here')
args1 = parser1.parse_args()
print args1

parser2 = argparse.ArgumentParser(prog='prog2', description='pars2')
parser2.add_argument('-b', '--bar', help='bar help', nargs=1)
args2 = parser2.parse_args()
print args2

