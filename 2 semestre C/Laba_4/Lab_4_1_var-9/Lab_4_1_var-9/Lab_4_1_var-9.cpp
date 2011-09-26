// Lab_4_1_var-9.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <malloc.h>
#include <conio.h>
#define max_length 50

const char priority[4][2] = {{'+','1'},{'-','1'},{'*','2'},{'/','2'}}; //массив соответствия приоритета операциям

typedef struct stack  //структура стека
{
	char value;
	struct stack* next;
};

struct stack* head = NULL; //голова стека

void StackPush(char value) //добавление эемента в стек
{
	struct stack* NewItem = (struct stack*) malloc(sizeof(struct stack));
	NewItem->value = value;
	NewItem->next = head;
	head = NewItem;
}

char StackPop(void) //взятие элемента из стека
{
	struct stack* item;
	char res = '0';
	if (head != NULL)
	{
		res = head->value;
		item = head;
		head = head->next;
		free(item);
	}
	return res;
}

int priory(char sign) //определение приоритета алгебраической операции
{
	int res = 1;
	for (int i = 0; i <= 4; i++)
		if (sign == priority[i][0])
			res = priority[i][1];
	return res;
}

char** InToPost(char expr[max_length])
{
	char** res = (char**) malloc(sizeof(char)*100); //создание выходного массива строк, в котором записаны операнды и операции в виде обратной польской записи
	for (int i=0; i <= 100; i++)
		res[i] = (char*) malloc(sizeof(char)*20);
	int i = 0, j = 0; //определение счетчиков для элемента в окончательной записи и в исходной
	while (expr[i] != '\0')
	{
		if ((expr[i] >= '0') && (expr[i] <= '9'))
		{
			int k = 0;
			while ((expr[i] >= '0') && (expr[i] <= '9'))
			{
				res[j][k] = expr[i]; 
				k++;
				i++;
			}
			res[j][k] = '\0';
			j++;
		}
		else
		{
			if (expr[i] != ' ')
			{	
				if (head == NULL)
					StackPush(expr[i]);
				else
				{ // Выталкивание более приоритетных
					while ((head != NULL) && (priory(expr[i]) <= priory(head->value))) 
					{
						res[j][0] = (char) StackPop();
						res[j][1] = '\0';
						j++;
					}
					StackPush(expr[i]); // Добавить после выталкивания
				}
				i++;
			}
			else
			{
				i++;
			}
		}
	}
	while (head != NULL) //выталкивание из стека оставшихся элементов
	{
		char oper = ' ';
		oper = (char) StackPop();
		res[j][0] = oper;
		res[j][1] = '\0';
		j++;
	}
	res[j][0] = '\0';
	return res;
}
bool correct_expr(char** expr)  //проверка корректности обратной польской записи
{
	int res = 0;
	int i = 0;
	while ((expr[i][0] != '\0') && (res >= 0))
	{
		if ((expr[i][0] >= '0') && (expr[i][0] <= '9'))
			res++;
		else 
			res--;
		i++;
	}
	if (res == 1) 
		return true;
	else
		return false;
}

int atoi(char* s) {
	int r = 0;
	for (; s[0] != 0; r = r*10 + (s[0] - '0'), s++);
	return r;
}

float calculation(char **expr)
{
	float stack[70];
	float res = 0;
	int m = 0; 
	int i = 0;
	puts("Expression in postfix form:");
	while (expr[i][0] != '\0')
	{
		printf("%s ",expr[i]);

		if (expr[i][0] >= '0' && expr[i][0] <= '9')
		{
			stack[m] = atoi(expr[i]);
			m++;
		}
		else
		{
			switch (expr[i][0])
			{
			case '+':
				{
					res = stack[m - 2] + stack[m - 1];
					break;
				} 
			case '-':
				{
					res = stack[m - 2] - stack[m - 1];
					break;
				}
			case '*':
				{
					res = stack[m - 2] * stack[m - 1];
					break;
				}
			case '/':
				{
					res = stack[m - 2] / stack[m - 1];
					break;
				}
			}
			stack[m - 2] = res;
			m--;
		}
		i++;
	}
	puts("");
	return res;
}

void _tmain(void) 
{
	puts("Enter expression in in infix form");
	char expres[max_length];
	gets(expres);
	char** InscrementExpr;
	InscrementExpr = InToPost(expres);
	if (correct_expr(InscrementExpr))
		printf("Entered expression = %.2f",calculation(InscrementExpr));
	else
		puts("Get correct expression");
	getch();
}