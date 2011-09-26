// Horoscope.cpp : Defines the entry point for the console application.

#include "stdafx.h"
#include <stdio.h>
#include <conio.h>
#include <stdlib.h>

/*Константа-массив, содержащий символьные обозначения всех знаков зодиака*/
const char* signs[] = {
	"Aquarius",
	"Pisces",
	"Aries",
	"Taurus",
	"Gemini",
	"Cancer",
	"Leo",
	"Virgo",
	"Libra",
	"Scorpio",
	"Sagittarius",
	"Capricorn"
};

/*Массив дней в месяцах*/
int months[12] = {
	31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
};

/*Массив дней перехода на знак*/
const int days[12] = {
	20, 50, 80, 111, 141, 172, 204, 235, 267, 297, 326, 356
};

/*Структура, для описания каждого партнера*/
struct partner
{
	int day, month, sign, element, gender; 
	partner()
	{
		sign = day = month = element = gender = 0;
	}
};

/*Определение стихии знака зодиака*/
int WhichElement(int sign);

/*День рождения по очередности в году*/
int HowManyDays(int month, int day);

/*Номер знака зодиака*/
int WhatSign(int birthdays);

void _tmain(void)
{
	/*Начальная инициализация двух партнеров*/
	struct partner FirstPerson, SecondPerson;
	int change=10;

	while (change != 0)
	{
		puts("Day and month of birth, gender (1-boy/2-girl)");
		puts("Data of first person:");
		printf("%d	%d	%s\n",FirstPerson.day, FirstPerson.month, ((FirstPerson.gender == 1) ? "boy" : "girl"));
		puts("Data of second person:");
		printf("%d	%d	%s\n",SecondPerson.day, SecondPerson.month, ((SecondPerson.gender == 1) ? "boy" : "girl"));
		puts("1.Please enter the data of first partner");
		puts("2.Please enter the data of second partner");
		puts("3.Determination of the zodiac partner");
		puts("4.Can the friendship between the partners?");
		puts("5.Could they be partners in business?");
		puts("6.There are a family relationship between the partners?");
		puts("7.About the author and version.");
		puts("0.Exit program");
		scanf("%d",&change);
		system("cls");
		switch (change)
		{
		case 1:
			puts("Input data of the first partner (day and month of birth, gender)"); 
			scanf("%d%d%d",&FirstPerson.day,&FirstPerson.month, &FirstPerson.gender);
			break;
		case 2:
			puts("Input data of the second partner (day and month of birth, gender)");
			scanf("%d%d%d",&SecondPerson.day,&SecondPerson.month, &SecondPerson.gender);
			break;
		case 3: 
			{
				FirstPerson.sign = WhatSign(HowManyDays(FirstPerson.month, FirstPerson.day));
				SecondPerson.sign = WhatSign(HowManyDays(SecondPerson.month, SecondPerson.day));
				printf("Sign of first parner:%s\n",signs[FirstPerson.sign-1]);
				printf("Sign of second parner:%s\n",signs[SecondPerson.sign-1]);
				break;
			}
		case 4: 
			{
				printf("%s\n",((WhichElement(FirstPerson.sign) == WhichElement(SecondPerson.sign)) ? "Friendship is possible between you" : "Friendship is impossible between you"));
				break;
			}
		case 5: 
			{
				int buffervalue;
				buffervalue = abs(FirstPerson.sign - SecondPerson.sign);
				printf("%s\n",(((buffervalue == 1) || (buffervalue == 11) || (buffervalue == 0)) ? "You can be partners in business" : "You can not be partners in business"));
				break;
			}
		case 6:
			{
				bool buffervalue = true;
				int SumElement = WhichElement(FirstPerson.sign) + WhichElement(SecondPerson.sign);
				buffervalue = (FirstPerson.gender != SecondPerson.gender) && ((SumElement == 3) || (SumElement == 7));
				printf("%s\n",(buffervalue ? "You can be a family" : "You can not be a family"));
				break;
			}
		case 7: 
			{
				puts("Version 1.0 alpha.");
				puts("Creator - Kliushnikov Nikita Group 052004");
				puts("Notice: Astrologers think that friendship is possible between partners");
				puts("if their marks are owned by one element, the partners may do business");
				puts("if they have the same zodiac sign or signs related, among the partners"); 
				puts("may be family relationships,if their signs are the elements of air ");
				puts("and water or fire and land");
				getch();
				system("cls");
				break;
			}
		}
	}
}

int WhatSign(int birthdays)
{
	int i = 0;
	while ((birthdays >= days[i]) && (i <= 11))
		i++;
	if (birthdays < 20)
		return 12;
	else
		return i;
}

int HowManyDays(int month, int day)
{
	int days = 0;
	for (int i=0; i<(month-1); i++)
		days += months[i];
	days += day;
	return days;
}

int WhichElement(int sign)
{
	if ((sign == 3) || (sign == 7) || (sign == 11))
		return 1;
	if ((sign == 4) || (sign == 8) || (sign == 12))
		return 2;
	if ((sign == 5) || (sign == 9) || (sign == 1))
		return 3;
	if ((sign == 6) || (sign == 10) || (sign == 2))
		return 4;
}