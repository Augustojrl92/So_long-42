# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aurodrig <aurodrig@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/08 16:45:44 by aurodrig          #+#    #+#              #
#    Updated: 2024/07/08 18:23:12 by aurodrig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	so_long

NAMEBONUS	=	so_long_bonus

MLX			=	libmlx.a

SRCS			=	so_long.c	\
					display/*	\
					parsing/*	\
					GNL/*		\
					utils/*

SRCS_BONUS			=	bonus/so_long.c	\
					bonus/display/*	\
					bonus/parsing/*	\
					bonus/GNL/*		\
					bonus/utils/*


CC			=	clang

CFLAGS		=	-Wall -Wextra -Werror

$(NAME):
			@echo "\033[31;1mCompiling for Linux...\033[0m"
			@chmod 777 mlx_linux/configure
			@ $(MAKE) -C mlx_linux all
			$(CC) $(CFLAGS) -g3 -o $(NAME) $(SRCS) -Imlx_linux -Lmlx_linux -lmlx -lmlx_Linux -L/usr/lib -lXext -lX11 -lm
			@echo "\033[32m[ ./so_long created ]"

all:		$(NAME)

bonus:		$(NAME_BONUS)
				@echo "\033[33m[so_long MACOS compilation with bonus...]"
				@ $(MAKE) -C mlx all
				@ cp ./mlx/$(MLX) .
				$(CC) $(CFLAGS) -g3 -Ofast -o $(NAMEBONUS) -Imlx $(SRCS_BONUS) -g -fsanitize=address -Lmlx -lmlx -lm -framework OpenGL -framework AppKit
				@echo "\033[32m[ ./so_long_bonus created ]"

bonus:		$(NAME_BONUS)
				@echo "\033[33m[so_long Linux compilation with bonus...]"
				@chmod 777 mlx_linux/configure
				@ $(MAKE) -C mlx_linux all
				$(CC) $(CFLAGS) -g3 -o $(NAMEBONUS) $(SRCS_BONUS) -Imlx_linux -Lmlx_linux -lmlx -lmlx_Linux -L/usr/lib -lXext -lX11 -lm
				@echo "\033[32m[ ./so_long_bonus created ]"

clean:
			@ echo "\033[31m[Remove last version...]"
			@ $(MAKE) -C mlx clean
			@ rm -rf so_long.dSYM so_long_bonus.dSYM >/dev/null 2>&1

clean:
			@ echo "\033[31m[Remove last version...]"
			@ $(MAKE) -C mlx_linux clean 
			@ rm -rf so_long.dSYM so_long_bonus.dSYM >/dev/null 2>&1

fclean:		clean
			@ rm $(MLX)
			@ rm so_long >/dev/null 2>&1
			@ rm so_long_bonus >/dev/null 2>&1

fclean:		clean
			@ rm so_long >/dev/null 2>&1
			@ rm so_long_bonus >/dev/null 2>&1

re:			fclean all

.PHONY:		$(NAME) all bonus test clean fclean re

