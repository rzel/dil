#!/usr/bin/python
# -*- coding: utf-8 -*-
# Author: Aziz Köksal
# License: Public Domain
# History:
#   1.0 on 20. Jan 2009:
#     First release.
import re, sys, subprocess

def main():
  if len(sys.argv) <= 1:
    print ("This little script opens a text file using kwrite.\n"
           "Usage: myopen.py 'FILE(LineNum[,ColumnNum])'\n"
           "Examples:\n"
           "  myopen.py '/home/user/src/main.d(39)'\n"
           "  myopen.py '/home/user/src/parser.d(432,30)'")
    return
  m = re.match(r"(.+?)\((\d+)(?:,\s*(\d+))?\)", sys.argv[1])
  if m == None:
    print "Error: pattern didn't match the argument."
    return

  filepath, line, column = m.groups()
  column = column if column != None else "1"
  coordinates = ["--line", str(int(line)-1),
                 "--column", str(int(column)-1)]

  subprocess.call(["kwrite", filepath] + coordinates)

if __name__ == "__main__":
  main()
