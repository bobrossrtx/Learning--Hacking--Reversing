#!/usr/bin/env python3

print(f"bin-1111 | {int('1111', 2)}\r\n") # bin => dec

for i in ["00000000", "00000010", "01010101", "11111111"]: # bin | dec | hex
  print("{0} | {1:3} | {2:2x}".format(i, int(i, 2), int(i, 2)))