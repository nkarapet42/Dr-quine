#include <stdio.h>
#define FILE_NAME "Grace_kid.c"
#define FT(x) int main() { FILE *f = fopen(FILE_NAME, "w"); if (f) { char *c = x; fprintf(f, c, 10, 34, c); fclose(f); } return 0; }
/*
    Grace comment
*/
#define CODE "#include <stdio.h>%1$c#define FILE_NAME %2$cGrace_kid.c%2$c%1$c#define FT(x) int main() { FILE *f = fopen(FILE_NAME, %2$cw%2$c); if (f) { char *c = x; fprintf(f, c, 10, 34, c); fclose(f); } return 0; }%1$c/*%1$c    Grace comment%1$c*/%1$c#define CODE %2$c%3$s%2$c%1$c%1$cFT(CODE)%1$c"

FT(CODE)
