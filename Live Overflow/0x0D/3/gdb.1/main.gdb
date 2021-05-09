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
(gdb) x win
0x8048424 <win>:        0x83e58955
(gdb) p win
$1 = {void (void)} 0x8048424 <win>
(gdb) set disassembly-flavor intel
(gdb) disassemble main
Dump of assembler code for function main:
0x08048438 <main+0>:    push   ebp
0x08048439 <main+1>:    mov    ebp,esp
0x0804843b <main+3>:    and    esp,0xfffffff0
0x0804843e <main+6>:    sub    esp,0x60
0x08048441 <main+9>:    mov    DWORD PTR [esp+0x5c],0x0
0x08048449 <main+17>:   lea    eax,[esp+0x1c]
0x0804844d <main+21>:   mov    DWORD PTR [esp],eax
0x08048450 <main+24>:   call   0x8048330 <gets@plt>
0x08048455 <main+29>:   cmp    DWORD PTR [esp+0x5c],0x0
0x0804845a <main+34>:   je     0x8048477 <main+63>
0x0804845c <main+36>:   mov    eax,0x8048560
0x08048461 <main+41>:   mov    edx,DWORD PTR [esp+0x5c]
0x08048465 <main+45>:   mov    DWORD PTR [esp+0x4],edx
0x08048469 <main+49>:   mov    DWORD PTR [esp],eax
0x0804846c <main+52>:   call   0x8048350 <printf@plt>
0x08048471 <main+57>:   mov    eax,DWORD PTR [esp+0x5c]
0x08048475 <main+61>:   call   eax
0x08048477 <main+63>:   leave  
0x08048478 <main+64>:   ret    
End of assembler dump.
(gdb) break *0x08048475
Breakpoint 1 at 0x8048475: file stack3/stack3.c, line 22.
(gdb) r
Starting program: /opt/protostar/bin/stack3 
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
calling function pointer, jumping to 0x41414141

Breakpoint 1, 0x08048475 in main (argc=1094795585, argv=0x414141) at stack3/stack3.c:22
22      stack3/stack3.c: No such file or directory.
        in stack3/stack3.c
(gdb) info registers 
eax            0x41414141       1094795585
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
(gdb) c
Continuing.

Program received signal SIGSEGV, Segmentation fault.
0x41414141 in ?? ()
(gdb) info registers 
eax            0x41414141       1094795585
ecx            0x0      0
edx            0xb7fd9340       -1208118464
ebx            0xb7fd7ff4       -1208123404
esp            0xbffff73c       0xbffff73c
ebp            0xbffff7a8       0xbffff7a8
esi            0x0      0
edi            0x0      0
eip            0x41414141       0x41414141
eflags         0x210292 [ AF SF IF RF ID ]
cs             0x73     115
ss             0x7b     123
ds             0x7b     123
es             0x7b     123
fs             0x0      0
gs             0x33     51
