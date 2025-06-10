TARGET = build

CC = gcc
FLAGS_CC = -Wall -Wextra -Werror

ASM_CC = nasm
ASM_FLAGS = -f elf64

COLLEEN_NAME = Colleen/Colleen
GRACE_NAME = Grace/Grace
SULLY_NAME = Sully/Sully

COLLEEN_SRC = Colleen/Colleen.s
GRACE_SRC = Grace/Grace.s
SULLY_SRC = Sully/Sully.s

COLLEEN_OBJ = $(COLLEEN_SRC:%.s=%.o)
GRACE_OBJ = $(GRACE_SRC:%.s=%.o)
SULLY_OBJ = $(SULLY_SRC:%.s=%.o)

GRACE_FILE = $(GRACE_NAME)_kid.s
SULLY_FILES = $(wildcard Sully/Sully_*)

RED    = \033[31m
GREEN  = \033[32m
YELLOW = \033[33m
BLUE   = \033[34m
PURPLE = \033[35m
CYAN   = \033[36m
RESET  = \033[0m

all: $(TARGET)

$(TARGET): $(COLLEEN_NAME) $(GRACE_NAME) $(SULLY_NAME)
	@echo "$(YELLOW)All targets built successfully!$(RESET)"

$(COLLEEN_NAME): $(COLLEEN_OBJ)
	@echo "$(CYAN)Linking object files into executable: $(COLLEEN_NAME) $(RESET)"
	@$(CC) $(FLAGS_CC) -no-pie  -o $@ $^
	@echo "$(GREEN)Build completed successfully!$(RESET)"

$(GRACE_NAME): $(GRACE_OBJ)
	@echo "$(CYAN)Linking object files into executable: $(GRACE_NAME) $(RESET)"
	@$(CC) $(FLAGS_CC) -nostartfiles -no-pie  -o $@ $^
	@echo "$(GREEN)Build completed successfully!$(RESET)"

$(SULLY_NAME): $(SULLY_OBJ)
	@echo "$(CYAN)Linking object files into executable: $(SULLY_NAME) $(RESET)"
	@$(CC) $(FLAGS_CC) -no-pie -o $@ $^
	@echo "$(GREEN)Build completed successfully!$(RESET)"

%.o: %.s
	@echo "$(BLUE)Compiling: $<$(RESET)"
	@$(ASM_CC) $(ASM_FLAGS) $< -o $@
	@echo "$(GREEN)Compilation of $< finished!$(RESET)"

clean:
	@rm -f $(COLLEEN_OBJ) $(GRACE_OBJ) $(SULLY_OBJ)
	@echo "$(RED)ASM Clean$(RESET)"

fclean: clean
	@rm -f $(COLLEEN_NAME) $(GRACE_NAME) $(GRACE_FILE) $(SULLY_NAME) $(SULLY_FILES)
	@echo "$(RED)ASM Fclean$(RESET)"

re: fclean all

.PHONY: all clean fclean re
