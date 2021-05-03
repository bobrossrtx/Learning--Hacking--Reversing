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
code flow successfully changed

Program received signal SIGSEGV, Segmentation fault.
0x00000000 in ?? ()