// Programming_4_2_lab_var_9.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#include <malloc.h>
#include <time.h>
#define NOS 32
#define MEMNUM 10000

typedef int Row[NOS+1];
typedef char Word[50];
Row *NumbOfSymbols;
Word *WordsList;

int ToUpRegister(int c);
int ToWordsList(char *FileName);
void FindWords(int);
int strcmp(char* str1, char* str2);


void _tmain(int argc, _TCHAR* argv[])
{
	char DicFileName[100];
	time_t t1, t2;

	printf("Please enter the dictionary file name:\n");
	scanf("%s",DicFileName);
	time(&t1);
	FindWords(ToWordsList(DicFileName));
	time(&t2);
	printf("\nTime: %.2lf",difftime(t2, t1));
	puts("\nPlease enter any key to close program...");
	getch();
	free(NumbOfSymbols);
	free(WordsList);

}


int strcmp(char* str1, char* str2)
{
	int i;
	for (i=0;str1[i]!=0&&str1[i]==str2[i];i++);
	return str1[i]==0?0:1;
}

void FindWords(int NumberOfWords)
{
	printf("\nResult: ");
	int Numb = 0;

	for (int i = 0; i < (NumberOfWords - 1); i++)
		for (int j = i + 1; j < NumberOfWords; j++)
		{
			bool Buff = true;
			if (NumbOfSymbols[i][32] != NumbOfSymbols[j][32]) 
				break;
			if (!strcmp(WordsList[i],WordsList[j]))
				break;
			for (int k = 0; k < NOS; k++)
				if (NumbOfSymbols[i][k] != NumbOfSymbols[j][k])
				{
					Buff = false;
					break;
				}
				if (Buff)
				{
					++Numb;
					printf("\n (%.0lf%c) %d:\tWord 1: %s\t Word 2: %s", (((float)i / NumberOfWords) * 100), 37, Numb,WordsList[i],WordsList[j]);
				}
		}
}

int ToWordsList(char *FileName)
{
	FILE *fp;
	char c = 0;
	int j = 0, m = 0, n = 0, MemI = 0;
	char buffer[100];

	fp = fopen(FileName,"r");
	if (!fp)
	{
		perror("Opening file");
		getch();
		exit(1);
	}

	NumbOfSymbols = (Row*) malloc(0);
	WordsList = (Word*) malloc(0);

	while ((c = fgetc(fp)) != EOF)
	{
		if ((ToUpRegister(c) >= 128) && (ToUpRegister(c) <= 159))
		{
			int i = 0;
			if (MemI == 0)
			{
				NumbOfSymbols = (Row*) realloc(NumbOfSymbols, (n += MEMNUM*sizeof(Row)));
				for (int k = 0; k < MEMNUM; k++)
					for (int iNul = 0; iNul < NOS; iNul++)
						NumbOfSymbols[j+k][iNul] = 0;
				WordsList = (Word*) realloc(WordsList, (m += MEMNUM*sizeof(Word)));
			}
			int s = 0;
			do
			{
				int BufferValue = ToUpRegister(c); 
				WordsList[j][i] = BufferValue;
				NumbOfSymbols[j][(BufferValue - 128)] += 1;
				i++;
				c = fgetc(fp);
			}while ((ToUpRegister(c) >= 128) && (ToUpRegister(c) <= 159));
			WordsList[j][i] = '\0';
			for (int i = 0; i < NOS; ++i)
				s=s*3+NumbOfSymbols[j][i];
			NumbOfSymbols[j][i] = s;
			j++;
			printf(".");
			MemI = ++MemI % MEMNUM;
		}
	}

	printf("\nNumber of words = %d",j);
	fclose(fp);
	return j;
}

int ToUpRegister(int c)
{
	c += 256;
	if ((c >= 160) && (c <= 175)) 
	{	
		return (c - 32);
	}
	else
	{
		if ((c >= 224) && (c <= 239))
		{
			return (c - 80);
		}
		else
		{
			return c;
		}
	}

} 
