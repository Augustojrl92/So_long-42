/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   itoa.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: aurodrig <aurodrig@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/07/08 16:45:44 by aurodrig          #+#    #+#             */
/*   Updated: 2024/07/08 16:46:26 by aurodrig         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/so_long.h"

size_t	ft_power(int n, int p)
{
	size_t	result;

	result = 1;
	if (p < 0)
		return (0);
	while (p > 0)
	{
		result *= n;
		p--;
	}
	return (result);
}

static	int	ft_val(int n)
{
	int	i;

	i = 0;
	if (n == 0)
		return (1);
	while (n != 0)
	{
		n = n / 10;
		i++;
	}
	return (i);
}

char	*ft_itoa(int n)
{
	int		i;
	int		j;
	char	*tab;
	int		power;

	i = 0;
	j = 0;
	tab = (char *)malloc(sizeof(*tab) * (ft_val(n) + 1));
	if (!tab)
		return (NULL);
	if (n == -2147483648)
		return (ft_strcpy(tab, "-2147483648"));
	if (n < 0)
	{
		tab[0] = '-';
		i++;
		n = n * (-1);
	}
	while (j < ft_val(n))
	{
		power = ft_val(n) - (j++) - 1;
		tab[i++] = 48 + (n / (ft_power(10, power)) % 10);
	}
	tab[i] = '\0';
	return (tab);
}
