#include "Student.h"

#ifndef WAYLENGTH
#define WAYLENGTH 200
#endif

class StudentsList
{
private:

public:
	Student* head;
	int Numb;

	StudentsList() 
	{
		Numb = 0;
		head = NULL;
	}
	
	~StudentsList() 
	{
		while (head != NULL) 
		{
			Student *bufferMember = head;
			head = head->next;
			delete bufferMember;
		}
	}

	void AddStudent(Student *student); 
	void RemoveStudent(Student *student); 
	void PrintAllList(void); 
	Student* GetStudent(int index); 
	int Scholarship(void); 
	void EditMemberInfo(Student *member, char *way); 
};