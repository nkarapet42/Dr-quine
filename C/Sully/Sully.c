#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main() {
    int i = 5;
    if ( i <= 0 ) {
        return 0;
    }
    char old_filename[25];
    sprintf(old_filename, "./Sully_%d.c", i);
    if (!strcmp(old_filename, __FILE__)) {
        --i;
    }
    char new_filename[25];
    sprintf(new_filename, "./Sully_%d.c", i);
    char execute_name[25];
    sprintf(execute_name, "./Sully_%d", i);
    FILE *f = fopen(new_filename, "w");
    if (!f) {
        return 1;
    }
    char *program = "#include <stdio.h>%1$c#include <string.h>%1$c#include <stdlib.h>%1$c%1$cint main() {%1$c    int i = %2$d;%1$c    if ( i <= 0 ) {%1$c        return 0;%1$c    }%1$c    char old_filename[25];%1$c    sprintf(old_filename, %3$c./Sully_%%d.c%3$c, i);%1$c    if (!strcmp(old_filename, __FILE__)) {%1$c        --i;%1$c    }%1$c    char new_filename[25];%1$c    sprintf(new_filename, %3$c./Sully_%%d.c%3$c, i);%1$c    char execute_name[25];%1$c    sprintf(execute_name, %3$c./Sully_%%d%3$c, i);%1$c    FILE *f = fopen(new_filename, %3$cw%3$c);%1$c    if (!f) {%1$c        return 1;%1$c    }%1$c    char *program = %3$c%4$s%3$c;%1$c    fprintf(f, program, 10, i, 34, program);%1$c    fclose(f);%1$c    char command[150];%1$c    sprintf(command, %3$cgcc -Wall -Wextra -Werror -o %%s %%s%3$c, execute_name, new_filename);%1$c    system(command);%1$c    char exec_command[50];%1$c    sprintf(exec_command, %3$c./%%s%3$c, execute_name);%1$c    system(exec_command);%1$c    return 0;%1$c}%1$c";
    fprintf(f, program, 10, i, 34, program);
    fclose(f);
    char command[150];
    sprintf(command, "gcc -Wall -Wextra -Werror -o %s %s", execute_name, new_filename);
    system(command);
    char exec_command[50];
    sprintf(exec_command, "./%s", execute_name);
    system(exec_command);
    return 0;
}
