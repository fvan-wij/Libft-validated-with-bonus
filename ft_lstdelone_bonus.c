/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstdelone.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fvan-wij <fvan-wij@student.codam.nl>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/10/31 09:27:44 by fvan-wij          #+#    #+#             */
/*   Updated: 2022/10/31 15:23:47 by fvan-wij         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

// void *del(void *node)
// {
// 	t_list *temp_node;
// 	temp_node = node;
// 	temp_node->content = NULL;
// }

void	ft_lstdelone(t_list *lst, void (*del)(void *))
{
	if (del != NULL)
		del(lst->content);
	free(lst);
}

// int	main(void)
// {
// 	t_list *head;
// 	char s[] = "DELETE ME!!";
// 	head = malloc(sizeof(t_list));
// 	if (!head)
// 		return (0);
// 	head->content = &s;
// 	head->next = NULL;
// 	ft_lstdelone(head, del);
// 	printf("%s", head->content);
// }