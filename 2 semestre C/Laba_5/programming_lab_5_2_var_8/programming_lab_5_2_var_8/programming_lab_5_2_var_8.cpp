// programming_lab_5_2_var_8.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "BinnaryTree.h"
#include <stdio.h>
#include <conio.h>
#include <stdlib.h>



void _tmain(void)
{
	char choise = '255';
	BinnaryTree Tree;

	while (choise != '0')
	{
		puts("1. Input values");
		puts("2. Input value to search if tree?");
		puts("3. Balanced tree?");
		puts("4. Print tree");
		puts("5. Input n random elements");
		puts("0. Exit");
		choise = getch();


		switch (choise)
		{
		case '1':
			{
				puts("Input:  (0 for end)");
				int inputValue;
				scanf("%d", &inputValue);
				while (inputValue != 0)
				{
					Tree.AddElement(inputValue);
					scanf("%d", &inputValue);
				}
				break;
			}
		case '2':
			{
				puts("Input value to search");
				int inputValue;
				scanf("%d", &inputValue);
				if (Tree.ThereElement(inputValue))
					puts("Element found");
				else
					puts("Element not found");
			}
		case '3':
			{
				if (Tree.BalancedTree())
					puts("Tree balanced");
				else 
					puts("Tree not balanced");
				break;
			}
		case '4':
			{
				puts("Tree:");
				if (Tree.Head != NULL)
					Tree.Print(Tree.Head);
				break;
			}
			case '5':
			{
				puts("Input n");
				int n = 0;
				scanf("%d", &n);
				srand(NULL);
				for (int i = 0; i< n; i++)
					Tree.AddElement(rand() % n);
				break;
			}
		default:
			{
				puts("Input correct value!");
				break;
			}
		}
		puts("");
	}
}

