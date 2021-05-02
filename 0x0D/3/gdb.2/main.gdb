user@protostar:/opt/protostar/bin$ gdb stack3
GNU gdb (GDB) 7.0.1-debian
Copyright (C) 2009 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "i486-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /opt/protostar/bin/stack3...done.
(gdb) break *0x08048475
Breakpoint 1 at 0x8048475: file stack3/stack3.c, line 22.
(gdb) r < /tmp/exp
Starting program: /opt/protostar/bin/stack3 < /tmp/exp
calling function pointer, jumping to 0x51515151

Breakpoint 1, 0x08048475 in main (argc=1, argv=0xbffff854) at stack3/stack3.c:22
22      stack3/stack3.c: No such file or directory.
        in stack3/stack3.c
(gdb) info registers 
eax            0x51515151       1364283729
ecx            0x0      0
edx            0xb7fd9340       -1208118464
ebx            0xb7fd7ff4       -1208123404
esp            0xbffff740       0xbffff740
ebp            0xbffff7a8       0xbffff7a8
esi            0x0      0
edi            0x0      0
eip            0x8048475        0x8048475 <main+61>
eflags         0x200292 [ AF SF IF ID ]
cs             0x73     115
ss             0x7b     123
ds             0x7b     123
es             0x7b     123
fs             0x0      0
gs             0x33     51
(gdb) x win
0x8048424 <win>:        0x83e58955
(gdb) r
The program being debugged has been started already.
Start it from the beginning? (y or n) y

Starting program: /opt/protostar/bin/stack3 < /tmp/exp
calling function pointer, jumping to 0x08048424

Breakpoint 1, 0x08048475 in main (argc=1, argv=0xbffff854) at stack3/stack3.c:22
22      in stack3/stack3.c
(gdb) info registers 
eax            0x8048424        134513700
ecx            0x0      0
edx            0xb7fd9340       -1208118464
ebx            0xb7fd7ff4       -1208123404
esp            0xbffff740       0xbffff740
ebp            0xbffff7a8       0xbffff7a8
esi            0x0      0
edi            0x0      0
eip            0x8048475        0x8048475 <main+61>
eflags         0x200292 [ AF SF IF ID ]
cs             0x73     115
ss             0x7b     123
ds             0x7b     123
es             0x7b     123
fs             0x0      0
gs             0x33     51
(gdb) si
win () at stack3/stack3.c:7
7       in stack3/stack3.c
(gdb) c
Continuing.
code flow successfully changed

Program exited with code 037.
