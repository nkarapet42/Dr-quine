TARGET = build

CC = gcc
FLAGS_CC = -Wall -Wextra -Werror

COLLEEN_NAME = Colleen/Colleen
GRACE_NAME = Grace/Grace
SULLY_NAME = Sully/Sully

COLLEEN_SRC = Colleen/Colleen.c
GRACE_SRC = Grace/Grace.c
SULLY_SRC = Sully/Sully.c

COLLEEN_OBJ = $(COLLEEN_SRC:.c=.o)
GRACE_OBJ = $(GRACE_SRC:.c=.o)
SULLY_OBJ = $(SULLY_SRC:.c=.o)

GRACE_FILE = $(GRACE_NAME)_kid.c
SULLY_FILES = $(wildcard Sully/Sully_*)

RED    = \033[31m
GREEN  = \033[32m
YELLOW = \033[33m
BLUE   = \033[34m
CYAN   = \033[36m
RESET  = \033[0m

all: $(TARGET)

$(TARGET): $(COLLEEN_NAME) $(GRACE_NAME) $(SULLY_NAME)

$(COLLEEN_NAME): $(COLLEEN_OBJ)
	@echo "$(CYAN)Linking object file into executable: $@$(RESET)"
	@$(CC) $(FLAGS_CC) -o $@ $^
	@echo "$(GREEN)Build completed successfully!$(RESET)"
$(GRACE_NAME): $(GRACE_OBJ)
	@echo "$(CYAN)Linking object file into executable: $@$(RESET)"
	@$(CC) $(FLAGS_CC) -o $@ $^
	@echo "$(GREEN)Build completed successfully!$(RESET)"
$(SULLY_NAME): $(SULLY_OBJ)
	@echo "$(CYAN)Linking object file into executable: $@$(RESET)"
	@$(CC) $(FLAGS_CC) -o $@ $^
	@echo "$(GREEN)Build completed successfully!$(RESET)"

%.o: %.c Makefile
	@echo "$(BLUE)Compiling: $<$(RESET)"
	@$(CC) $(FLAGS_CC) -c -o $@ $<
	@echo "$(GREEN)Compilation of $< finished!$(RESET)"

clean:
	@echo "$(YELLOW)Cleaning up object files...$(RESET)"
	@rm -f $(COLLEEN_OBJ) $(GRACE_OBJ) $(SULLY_OBJ)
	@echo "$(RED)Clean up complete.$(RESET)"

fclean: clean
	@echo "$(YELLOW)Cleaning up executable...$(RESET)"
	@rm -f $(COLLEEN_NAME) $(GRACE_NAME) $(GRACE_FILE) $(SULLY_NAME) $(SULLY_FILES)
	@echo "$(RED)Clean up complete.$(RESET)"

re: fclean all

.PHONY: all clean fclean re
