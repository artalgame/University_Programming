#include "stdafx.h"
#include <stdio.h>
#include <conio.h>

/* ѕроцедура дл€ перевода числа из двоичной сс в дес€тичную сс */ 
unsigned long int binto(char binary[100], int length)
{
	unsigned long int res=0, step=1;

	for (int i = 1; i <= length; i++)
	{
		res = res + step * binary[i];
		step = step * 2;	
	}

	return res; 
}

/*ƒобавление к двоичной записи числа либо 11 либо 00*/
void binadd(char binary[100], int length, bool number)
{
	for (int i = length; i > 0; i--)
		binary[i+2] = binary[i];

	if (number)
		binary[1] = binary[2] = 1;
	else
		binary[1] = binary[2] = 0;
}

/*—ам поик чисел и проверка соответстви€ условию*/
void _tmain(void)
{
	unsigned long int num;
	int length;
	printf("Please enter the number >0 and <=1000000000:  ");
	scanf_s("%d", &num);

	if (num <= 1000000000)
	{
		unsigned long int x = 0;
		char binary[100];
		bool logic = false;
		printf("Decimal form ; Binary form\n");
		binary[1] = binary[2] = 1;
		length = 2;
		x = binto(binary, length);

		while (x <= num)
		{
			printf("%d ; ", x);

			for (int i = length; i > 0; i--)
				printf("%d", binary[i]);

			printf("\n");
			binadd(binary, length, logic);
			length = length + 2;
			logic = !logic;
			x = binto(binary, length);
		}
	}
	else 
		printf("Get number >0 and <=1000000000!!!!!!\n");

	getchar();
	getchar();
}

