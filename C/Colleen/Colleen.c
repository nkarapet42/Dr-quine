#include <stdio.h>

void foo() {}

/*
    This is comment outside the main function.
*/
int main() {
    /*
        This is comment inside the main.
    */
    char *program = "#include <stdio.h>%1$c%1$cvoid foo() {}%1$c%1$c/*%1$c    This is comment outside the main function.%1$c*/%1$cint main() {%1$c    /*%1$c        This is comment inside the main.%1$c    */%1$c    char *program = %2$c%3$s%2$c;%1$c    printf(program, 10,34,program);%1$c    foo();%1$c    return 0;%1$c}";
    printf(program, 10,34,program);
    foo();
    return 0;
}