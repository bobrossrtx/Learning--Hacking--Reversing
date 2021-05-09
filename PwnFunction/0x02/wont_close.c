#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>

int main () {
    int file_descriptor;
    file_descriptor = open("/etc/passwd", 0);

    setuid(getuid()); // drop privileges

    char *args[] = {"sh", 0};
    execvp("/bin/sh", args);
    return 0;
}