#include "StudentsList.h"

class DateBase
{
public:
	StudentsList *students;

	DateBase()
	{
		students = new StudentsList();
		FILE *fp;
		fp = fopen("data.db", "rb");
		if (fp)
		{
			int numb = fgetc(fp);
			for (int i = 1; i <= numb; i++)
			{
				Student *bufferStudent = new Student();
				fread(bufferStudent, sizeof(Student), 1, fp);
				bufferStudent->next = NULL;
				bufferStudent->prev = NULL;
				students->AddStudent(bufferStudent);
			}
			fclose(fp);
		}
	}

	~DateBase()
	{
		FILE *fp;
		fp = fopen("data.db", "wb");
		if (fp)
		{
			fputc(students->Numb, fp);
			for (int i = 1; i <= students->Numb; i++)
				fwrite(students->GetStudent(i), sizeof(Student), 1, fp);
			fclose(fp);
		}
		delete students;
	}

	void FindMembers(char *way); 
	void PrintStatement(char *way); 
};