/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   so_long.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: aurodrig <aurodrig@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/07/08 16:45:44 by aurodrig          #+#    #+#             */
/*   Updated: 2024/07/08 16:48:08 by aurodrig         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "inc/so_long.h"

int	main(int argc, char **argv)
{
	t_long	solong;

	initvar(&solong);
	if (argc == 1)
		showerror(&solong, "Missing map (./so_long maps/intra.ber)");
	if (argc > 2)
		showerror(&solong, "Too many arguments");
	parsing(&solong, argv[1]);
	display(&solong);
	return (0);
}
