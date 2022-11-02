# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fvan-wij <fvan-wij@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/01 18:08:39 by fvan-wij          #+#    #+#              #
#    Updated: 2022/11/02 11:27:02 by fvan-wij         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		:=	libft.a

HEADER		:=	libft.h

SRC			:=	ft_atoi.c \
			ft_bzero.c \
			ft_calloc.c \
			ft_isalnum.c \
			ft_isalpha.c \
			ft_isascii.c \
			ft_isdigit.c \
			ft_isprint.c \
			ft_memchr.c \
			ft_memcmp.c \
			ft_memcpy.c \
			ft_memmove.c \
			ft_memset.c \
			ft_strchr.c \
			ft_strdup.c \
			ft_strlcat.c \
			ft_strlcpy.c \
			ft_strlen.c \
			ft_strncmp.c \
			ft_strnstr.c \
			ft_strrchr.c \
			ft_tolower.c \
			ft_toupper.c \
			ft_putchar_fd.c \
			ft_putendl_fd.c \
			ft_putnbr_fd.c \
			ft_putstr_fd.c \
			ft_itoa.c \
			ft_strtrim.c \
			ft_substr.c \
			ft_strjoin.c \
			ft_split.c \
			ft_striteri.c \
			ft_strmapi.c

BONUS		:= 	ft_lstnew_bonus.c \
			ft_lstadd_front_bonus.c \
			ft_lstsize_bonus.c \
			ft_lstlast_bonus.c \
			ft_lstadd_back_bonus.c \
			ft_lstdelone_bonus.c \
			ft_lstclear_bonus.c \
			ft_lstiter_bonus.c \
			ft_lstmap_bonus.c

OBJ 		:= $(SRC:.c=.o)

CC			:= gcc

CFLAGS		:= -Wall -Werror -Wextra

BONUSOBJ 	:= $(BONUS:.c=.o)

RMV			:= rm -f

# Regular Colors
Black		= "\033[0;30m"		# Black
Red			= "\033[0;31m"		# Red
Green		= "\033[0;32m"		# Green
Yellow		= "\033[0;33m"		# Yellow
Blue		= "\033[0;34m"		# Blue
Purple		= "\033[0;35m"		# Purple
Cyan		= "\033[0;36m"		# Cyan
White		= "\033[0;37m"		# White

# Reset
Color_Off	= "\033[0m"			# Text Reset
Text_Off	= "\033[0m"			# Text Style

#Text styles
Bold		= "\033[1m"

#Avoid bonus from relinking
ifdef WITH_BONUS
	OBJ_FILES = $(OBJ) $(BONUSOBJ)
else
	OBJ_FILES = $(OBJ)
endif

$(NAME): 	$(OBJ)
			@ar -rcs $(NAME) $(OBJ)
			@echo $(Green) $(Bold) Completed ✅ $(Color_Off) $(Text_Off)

all: 		$(NAME)

%.o: 		%.c
			@echo $(Blue) Building... $^ $(Color_Off)
			@$(CC) $(CFLAGS) -c -o $@ $^

clean: 		
			@echo $(Yellow) Cleaned all object files! $(Color_Off)
			@$(RMV) $(OBJ) $(BONUSOBJ)

fclean: 	clean
			@echo $(Yellow) Cleaned libft.a! $(Color_Off)
			@$(RMV) $(NAME)

re: 		fclean $(NAME)

bonus:		$(OBJ)	$(BONUSOBJ)
			$(MAKE) WITH_BONUS=1 all
			@ar -rcs $(NAME) $(OBJ) $(BONUSOBJ)
			@echo $(Green) $(Bold) Completed Bonus ✅ $(Color_Off) $(Text_Off)

.PHONY:		all clean fclean re bonus
