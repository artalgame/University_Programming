#include "stdafx.h"
#include "DB.h"
#include <string.h>
#include <ctype.h>

void DateBase::PrintStatement(char *way)
{
	char Way[WAYLENGTH], bufferstring[30];
	int ch = 255;
	gets(bufferstring);
	sprintf(Way, "%s->Print Statement", way);
	while (ch != 0)
	{
		puts(Way);
		puts("Your choice:");
		puts("1. Print general statement");
		puts("2. Print students who receive a stipend increased");
		puts("3. Print students receiving social allowance");
		printf("0. Back to %s\n", way);
		scanf("%d", &ch);
		switch (ch)
		{
		case 1:
			{
				puts("General Statement:");
				puts("--------------------------------------------------------");
				students->PrintAllList();
				puts("--------------------------------------------------------");
				printf("All money of scholarship - %d\n", students->Scholarship());
				break;
			}
		case 2:
			{
				puts("Students, who receive a stripend increased:");
				puts("--------------------------------------------------------");
				for (int i = 1; i <= students->Numb; i++)
					if (students->GetStudent(i)->Score() >= 5)
						puts(students->GetStudent(i)->ToString());
				puts("--------------------------------------------------------");
				break;
			}
		case 3:
			{
				puts("Students, who receive a social allowance:");
				puts("--------------------------------------------------------");
				for (int i = 1; i <= students->Numb; i++)
					if (students->GetStudent(i)->SocialAllowance > 0)
						puts(students->GetStudent(i)->ToString());
				puts("--------------------------------------------------------");
				break;
			}
		default:
			{
				break;
			}
			gets(bufferstring);
		}
	}
}

void DateBase::FindMembers(char *way)  
{
	char Way[WAYLENGTH], bufferstring[30];
	int choice;

	gets(bufferstring);
	sprintf(Way, "%s->Finding  and Print students", way);
	puts(Way);
	puts("On which field to search?");
	puts("1. First Name");
	puts("2. Last Name");
	puts("3. Middle Name");
	puts("4. Social allowance");
	puts("5. Average score");
	puts("6. Scholarship Count University");
	puts("7. Departament Petition");
	printf("0. Back to %s\n", way);
	scanf("%d", &choice);
	gets(bufferstring);

	switch (choice)
	{
	case 1:
		{
			puts("Input First name");
			char str[NAMELENGTH];
			scanf("%s", str);
			puts("--------------------------------------------------------");
			for (int i = 1; i <= students->Numb; i++)
				if (stricmp(students->GetStudent(i)->FirstName, str) == 0)
					puts((students->GetStudent(i))->ToString());
			puts("--------------------------------------------------------");
			break;
		}
	case 2:
		{
			puts("Input Last name");
			char str[NAMELENGTH];
			scanf("%s", str);
			puts("--------------------------------------------------------");
			for (int i = 1; i <= students->Numb; i++)
				if (stricmp(students->GetStudent(i)->LastName, str) == 0)
					puts((students->GetStudent(i))->ToString());
			puts("--------------------------------------------------------");
			break;
		}
	case 3:
		{
			puts("Input Middle name");
			char str[NAMELENGTH];
			scanf("%s", str);
			puts("--------------------------------------------------------");
			for (int i = 1; i <= students->Numb; i++)
				if (stricmp(students->GetStudent(i)->MiddleName, str) == 0)
					puts((students->GetStudent(i))->ToString());
			puts("--------------------------------------------------------");
			break;
		}
	case 4:
		{
			puts("Input Social allowance");
			int value;
			scanf("%d", &value);
			puts("--------------------------------------------------------");
			for (int i = 1; i <= students->Numb; i++)
				if (students->GetStudent(i)->SocialAllowance == value)
					puts((students->GetStudent(i))->ToString());
			puts("--------------------------------------------------------");
			break;
		}
	case 5:
		{
			puts("Input average score");
			float value;
			scanf("%f", &value);
			puts("--------------------------------------------------------");
			for (int i = 1; i <= students->Numb; i++)
				if (students->GetStudent(i)->Score() == value)
					puts((students->GetStudent(i))->ToString());
			puts("--------------------------------------------------------");
			break;
		}
	case 6:
		{
			puts("Input the existence of scholarship count university (y/n)");
			char value;
			scanf("%c", &value);
			value = toupper(value);
			bool IfScholarship;
			if ((value == 'Y') || (value == 'N'))
			{
				puts("--------------------------------------------------------");
				IfScholarship = (value == 'Y')? true: false;
				for (int i = 1; i <= students->Numb; i++)
					if (students->GetStudent(i)->SchCounUniver == IfScholarship)
						puts((students->GetStudent(i))->ToString());
				puts("--------------------------------------------------------");
			}
			else
			{
				puts("Incorrent choice!");
				getchar();
			}
			break;
		}
	case 7:
		{
			puts("Input a petition the department (y/n)");
			char value;
			scanf("%c", &value);
			value = toupper(value);
			if ((value == 'Y') || (value == 'N'))
			{
				puts("--------------------------------------------------------");
				if (value == 'Y')
					for (int i = 1; i <= students->Numb; i++)
						if (students->GetStudent(i)->HavePetition)
							puts((students->GetStudent(i))->ToString());
				if (value == 'N')
					for (int i = 1; i <= students->Numb; i++)
						if (!(students->GetStudent(i)->HavePetition))
							puts((students->GetStudent(i))->ToString());
				puts("--------------------------------------------------------");
			}
			else
			{
				puts("Incorrect choice!");
			}
			break;
		}
	default:
		{
			break;
		}
	}
}