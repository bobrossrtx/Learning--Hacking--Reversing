#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>

int main(int argc, char **argv)
{
  char *variable;

  variable = getenv("GREENIE");                                   // Getting the environment variable GREENIE (Returns value, not address)

  if(variable == NULL) {
      errx(1, "please set the GREENIE environment variable\n");
  } else {
    printf(variable);                                             // Prints the value of the variable (not address)
  }

}