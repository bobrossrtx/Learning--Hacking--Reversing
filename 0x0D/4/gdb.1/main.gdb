user@protostar:/opt/protostar/bin$ gdb stack4
GNU gdb (GDB) 7.0.1-debian
Copyright (C) 2009 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "i486-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /opt/protostar/bin/stack4...done.
(gdb) r < /tmp/exp
Starting program: /opt/protostar/bin/stack4 < /tmp/exp

Program received signal SIGSEGV, Segmentation fault.
0x54545454 in ?? ()
(gdb) info registers
eax            0xbffff760       -1073744032
ecx            0xbffff760       -1073744032
edx            0xb7fd9334       -1208118476
ebx            0xb7fd7ff4       -1208123404
esp            0xbffff7b0       0xbffff7b0
ebp            0x53535353       0x53535353
esi            0x0      0
edi            0x0      0
eip            0x54545454       0x54545454
eflags         0x210246 [ PF ZF IF RF ID ]
cs             0x73     115
ss             0x7b     123
ds             0x7b     123
es             0x7b     123
fs             0x0      0
gs             0x33     51