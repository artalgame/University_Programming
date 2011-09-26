#include "stdafx.h"
#include "StudentsList.h"
#include <ctype.h>
#include <string.h>

void StudentsList::AddStudent(Student *student)
{
	if (head == NULL) 
	{
		head = student;
	}
	else
	{
		Student *bufferMember = head, *backMember = NULL;

		while (strcmp(student->FirstName, bufferMember->FirstName) > 0 )
		{
			backMember = bufferMember;
			bufferMember = bufferMember->next;
			if (bufferMember == NULL)
				break;
		}

		if (backMember == NULL)
		{
			student->next = head;
			head->prev = student;
			head = student;
		}
		else
			if (bufferMember == NULL)
			{
				backMember->next = student;
				student->prev = backMember;
			}
			else
			{
				bufferMember->prev->next = student;
				student->prev = bufferMember->prev;
				student->next = bufferMember;
				bufferMember->prev = student;
			}
	}
	Numb++;
}

void StudentsList::RemoveStudent(Student *student)
{
	if (Numb > 0)
	{
		if ((student->next != NULL) && (student->prev != NULL))
		{
			Student *bufferMember = student;
			student->prev->next = student->next;
			student->next->prev = student->prev;
		}
		else
			if ((student->next == NULL) && (student->prev != NULL))
			{
				student->prev->next = NULL;
			}
			else
			{
				if ((student->prev == NULL) && (student->next != NULL))
				{
					student->next->prev = NULL;
					head = student->next;
				}
				else
					head = NULL;
			}
			
		Numb--;
		free(student);
	}
}

void StudentsList::PrintAllList(void)
{
	Student *bufferMember = head;
	for (int i = 1; i <= Numb; i++)
	{
		printf("%d: ",i);
		printf(bufferMember->ToString());
		puts("");
		bufferMember = bufferMember->next;
	}
}

Student* StudentsList::GetStudent(int index) 
{
	if (index <= Numb)
	{
		Student *bufferMember = head;
		for (int i = 1; i < index; i++)
			bufferMember = bufferMember->next;
		return bufferMember;
	}
	else
		return NULL;

}

int StudentsList::Scholarship(void) 
{
	int res = 0;
	Student *bufferMember = head;

	for (int i = 1; i <= Numb; i++)
	{
		res += bufferMember->Scholarship();
		bufferMember = bufferMember->next;
	}
	return res;
}

void StudentsList::EditMemberInfo(Student *member, char *way) //+
{
	char Way[WAYLENGTH], bufferstring[30];
	gets(bufferstring);
	int choice = 255;
	sprintf(Way, "%s->Edit Member Info", way);
	while (choice != 0)
	{
		puts(Way);
		puts("Enter your choice:");
		puts("1. First name");
		puts("2. Last name");
		puts("3. Middle name");
		puts("4. Social allowance");
		puts("5. Average score");
		puts("6. Scholarship count university");
		puts("7. Departament petition");
		printf("0. Back to %s\n", way);
		scanf("%d", &choice);
		gets(bufferstring);
		switch (choice)
		{
		case 1:
			{
				puts("Inut new First Name of student");
				gets(member->FirstName);
				break;
			}
		case 2:
			{
				puts("Inut new Last Name of student");
				gets(member->LastName);
				break;
			}
		case 3:
			{
				puts("Inut new Middle Name of student");
				gets(member->MiddleName);
				break;
			}
		case 4:
			{
				puts("Input new social allowance");
				int bufferValue;
				scanf("%d", &bufferValue);
				member->SocialAllowance = bufferValue;
				break;
			}
		case 5:
			{
				puts("Input new average score of student");
				float bufferValue;
				scanf("%f", &bufferValue);
				member->AverageScore = bufferValue;
				break;
			}
		case 6: 
			{
				puts("Student have scholarship count university? (y/n)");
				char ch = getchar();
				ch = toupper(ch);
				if ((ch == 'Y') || (ch == 'N'))
					member->SchCounUniver = ((ch == 'Y')? true: false);
				else
					puts("Input correct choice!");
				break;
			}
		case 7:
			{ 
				puts("Student have department petition? (y/n)");
				char ch = getchar();
				ch = toupper(ch);
				if ((ch == 'Y') || (ch == 'N'))
					member->HavePetition = ((ch == 'Y')? true: false);
				else
					puts("Input correct choice!");
				break;
			}
		default:
			{
				break;
			}
		}
	}
}