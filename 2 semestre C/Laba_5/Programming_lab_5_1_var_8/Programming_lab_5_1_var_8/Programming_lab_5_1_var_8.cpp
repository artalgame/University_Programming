// Programming_lab_5_1_var_8.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <conio.h>
#include "Queue.h"
#include "List.h"

void _tmain(void)
{
	int n1, n2;
	Queue Queue_1, Queue_2;
	List List1;

	puts("Enter number of elements of first queue:");
	scanf("%d",&n1);
	for (int i = 0; i < n1; i++)
	{
		int value;
		printf("---> ");
		scanf("%d",&value);
		Queue_1.AddElem(value);
	}

	puts("Enter number of elements of second queue:");
	scanf("%d",&n2);
	for (int i = 0; i < n2; i++)
	{
		int value;
		printf("---> ");
		scanf("%d",&value);
		Queue_2.AddElem(value);
	}

	puts("First queue:");
	Queue_1.PrintQueue();
	puts("Second queue");
	Queue_2.PrintQueue();

	int j = 0;
	int i = 0;
	int a = Queue_1.GetElem(), b = Queue_2.GetElem();
	
	while ((i < n1) && (j < n2))
	{
		if (a > b)
		{
			List1.AddFirst(b);
			b = Queue_2.GetElem();
			j++;
		}
		else
		{
			List1.AddFirst(a);
			a = Queue_1.GetElem();
			i++;
		}
	}

	if (i == n1)
	{
		List1.AddFirst(b);
		while (j < n2-1)
		{	
			List1.AddFirst(Queue_2.GetElem());
			j++;
		}
	}
	else 
	{
		List1.AddFirst(a);
		while (i < n1-1)
		{
			List1.AddFirst(Queue_1.GetElem());
			i++;
		}
	}

	puts("Result list:");
	List1.BackPrintList();

	getch();
}

