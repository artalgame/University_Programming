#include "stdafx.h"
#include "Menu.h"
#include <iostream>
#include <string.h>
#include <stdlib.h>


void Menu::ShowAbout(char *way)
{
	char Way[WAYLENGTH];
	sprintf(Way, "%s->Help", way);
	puts(Way);
	printf("This program is for settlement group BSUIR. \nIts capabilities include: counting scholarships \nfor each student, the total money allocated for \naccrual of scholarships and the list of students \nreceiving a stipend increased, the list of students \nreceiving social support. Search students in any \nfield of the database. \n");
	getchar();
}

void Menu::AddStudentsInformation(char *way)
{
	char Way[WAYLENGTH], bufferString[3] = "";
	int ch = 255;
	getchar();
	while (true)
	{
		sprintf(Way, "%s->Adding students", way);
		puts(Way);
		puts("Input anykey to input student information or input 0 to exit");
		scanf("%d", &ch);
		if (ch == 0)
			break;
		puts("Input student first name");
		char fname[NAMELENGTH], lname[NAMELENGTH], mname[NAMELENGTH];
		gets(fname);
		gets(fname);
		puts("Input student last name");
		gets(lname);
		puts("Input student middle name ");
		gets(mname);
		puts("Input average score of student");
		float avsc;
		scanf("%f", &avsc);
		Student *bufferStud = new Student(fname, lname, mname, avsc);
		db->students->AddStudent(bufferStud);
		gets(fname);
	}
}

void Menu::MainMenu()
{
	char *Way = "Main Menu"; 
	int ch = 255;
	while (true)
	{
		puts(Way);
		puts("1. Work with general students list");
		puts("2. Print statements");
		puts("3. Find students on a any field of date base");
		puts("4. About");
		puts("0. Exit");
		scanf("%d", &ch);
		if (!ch)
			break;
		switch (ch)
		{
		case 1:
			{
				WorkWithGeneralStudList(Way);
				break;
			}
		case 2:
			{
				db->PrintStatement(Way);
				break;
			}
		case 3:
			{
				FindStudents(Way);
				break;
			}
		case 4:
			{
				ShowAbout(Way);
				break;
			}
		default:
			{
				break;
			}
		}
		getchar();
	}

}

void Menu::WorkWithGeneralStudList(char *way)
{
	char Way[WAYLENGTH];
	int ch = 255;
	sprintf(Way, "%s->Work with general students list", way);
	getchar();
	while (true)
	{
		puts(Way);
		puts("1. Add students");
		puts("2. Managing general student list");
		printf("0. Back to %s\n", way);
		scanf("%d", &ch);
		if (ch == 0)
			break;
		switch (ch)
		{
		case 1:
			{
				AddStudentsInformation(Way);
				break;
			}
		case 2:
			{
				StudentsManager(db->students, Way);
				break;
			}
		default:
			{
				break;
			}
		}
		getchar();
	}
}

void Menu::StudentScholarship(StudentsList *studs, char *way)
{
	char Way[WAYLENGTH];
	sprintf(Way, "%s->Student Scholarship", way);
	puts(Way);
	puts("Students list:");
	puts("--------------------------------------------------------");
	studs->PrintAllList();
	puts("--------------------------------------------------------");
	puts("Input student number to print it scholarship");
	int No = 0;
	scanf("%d", &No);
	if ((No <= studs->Numb) && (No > 0))
	{
		printf("Student No %d scholarship is %d", No, studs->GetStudent(No)->Scholarship());
	}
	else 
		puts("Incorrect student No");
	getchar();
}

void Menu::FindStudents(char *way)
{
	db->FindMembers(way);
}

void Menu::StudentsManager(StudentsList *studList, char *way) //+
{
	char Way[WAYLENGTH], bufferString[30];
	int ch = 255;
	gets(bufferString);
	sprintf(Way, "%s->Managing students list", way);
	while (true)
	{
		puts(Way);
		puts("1. Edit student #");
		puts("2. Print students list");
		puts("3. Remove student with #");
		puts("4. Print scholarship for a student with #");
		printf("0. Back to %s\n", way);
		scanf("%d", &ch);
		if (ch == 0) 
			break;
		switch (ch)
		{
		case 1:
			{
				puts("Input student number to  it edit information");
				int No = 0;
				scanf("%d", &No);
				if ((No <= studList->Numb) && (No > 0))
				{
					studList->EditMemberInfo(studList->GetStudent(No), Way);
				}
				else
					puts("Incorrect student No");
				break;
			}
		case 2:
			{
				puts("Students List:");
				puts("--------------------------------------------------------");
				studList->PrintAllList();
				puts("--------------------------------------------------------");
				getchar();
				break;
			}
		case 3:
			{
				puts("Input student number to remove it from the list");
				int No = 0;
				scanf("%d", &No);
				if ((No <= studList->Numb) && (No > 0))
				{
					studList->RemoveStudent(studList->GetStudent(No));
				}
				else 
					puts("Incorrect student No");
				break;
			}
		case 4:
			{
				StudentScholarship(studList, Way);
				break;
			}
		default:
			{
				break;
			}
		}
		gets(bufferString);
	}
}