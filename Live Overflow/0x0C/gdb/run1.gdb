(gdb) r
The program being debugged has been started already.
Start it from the beginning? (y or n) y
Starting program: /opt/protostar/bin/stack0 
eax            0xbffff75c       -1073744036
ecx            0xe4bcad1f       -457396961
edx            0x1      1
ebx            0xb7fd7ff4       -1208123404
esp            0xbffff740       0xbffff740
ebp            0xbffff7a8       0xbffff7a8
esi            0x0      0
edi            0x0      0
eip            0x804840c        0x804840c <main+24>
eflags         0x200282 [ SF IF ID ]
cs             0x73     115
ss             0x7b     123
ds             0x7b     123
es             0x7b     123
fs             0x0      0
gs             0x33     51
0xbffff740:     0xbffff75c      0x00000001      0xb7fff8f8      0xb7f0186e
0xbffff750:     0xb7fd7ff4      0xb7ec6165      0xbffff768      0xb7eada75
0xbffff760:     0xb7fd7ff4      0x08049620      0xbffff778      0x080482e8
0xbffff770:     0xb7ff1040      0x08049620      0xbffff7a8      0x08048469
0xbffff780:     0xb7fd8304      0xb7fd7ff4      0x08048450      0xbffff7a8
0xbffff790:     0xb7ec6365      0xb7ff1040      0x0804845b      0x00000000
0x804840c <main+24>:    call   0x804830c <gets@plt>
0x8048411 <main+29>:    mov    eax,DWORD PTR [esp+0x5c]

Breakpoint 2, 0x0804840c in main (argc=1, argv=0xbffff854) at stack0/stack0.c:11
11      in stack0/stack0.c
(gdb) c
Continuing.
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
eax            0xbffff75c       -1073744036
ecx            0xbffff75c       -1073744036
edx            0xb7fd9334       -1208118476
ebx            0xb7fd7ff4       -1208123404
esp            0xbffff740       0xbffff740
ebp            0xbffff7a8       0xbffff7a8
esi            0x0      0
edi            0x0      0
eip            0x8048411        0x8048411 <main+29>
eflags         0x200246 [ PF ZF IF ID ]
cs             0x73     115
ss             0x7b     123
ds             0x7b     123
es             0x7b     123
fs             0x0      0
gs             0x33     51
0xbffff740:     0xbffff75c      0x00000001      0xb7fff8f8      0xb7f0186e
0xbffff750:     0xb7fd7ff4      0xb7ec6165      0xbffff768      0x41414141
0xbffff760:     0x41414141      0x41414141      0x41414141      0x41414141
0xbffff770:     0x41414141      0x41414141      0x41414141      0x08048400
0xbffff780:     0xb7fd8304      0xb7fd7ff4      0x08048450      0xbffff7a8
0xbffff790:     0xb7ec6365      0xb7ff1040      0x0804845b      0x00000000
0x8048411 <main+29>:    mov    eax,DWORD PTR [esp+0x5c]
0x8048415 <main+33>:    test   eax,eax

Breakpoint 3, main (argc=1, argv=0xbffff854) at stack0/stack0.c:13
13      in stack0/stack0.c
(gdb) x/wx $esp+0x5c
0xbffff79c:     0x00000000