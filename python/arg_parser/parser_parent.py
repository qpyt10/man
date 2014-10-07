#!/usr/bin/python

import argparse

parent_parser = argparse.ArgumentParser(add_help=False)
parent_parser.add_argument('-a', type=int)
parent_parser.add_argument('-b', type=int)

foo_parser = argparse.ArgumentParser(parents=[parent_parser])
foo_parser.add_argument('-f')
args = foo_parser.parse_args()
print args

