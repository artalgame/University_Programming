#include "DB.h"

typedef class Menu_
{
public:
	DateBase *db;

	Menu_()
	{
		db = new DateBase();
	}

	~Menu_()
	{
		delete db;
	}

void MainMenu(void); 
void WorkWithGeneralStudList(char *way); 
void FindStudents(char *way); 
void StudentsManager(StudentsList *studList, char *way); 
void StudentScholarship(StudentsList *studs, char *way); 
void ShowAbout(char *way); 
void AddStudentsInformation(char *way); 
} Menu;

/*
����:
	���� ������ � �������� ������� ���������:
		���� ���������� � ��������
		������ � �������� ������� ���������
			��������� ���������� � �������� �� ������
			���������� ������ ���������,� ������� ���� ������
			�������� ��������� �� ������ � ������
			������ ��������� �� �������� �� ��� ������
	������ ���������:
		�������� ���������. � ����� ������ �����
		������, ���������� ���������� ���������
		������ �����, ���������� ��� ��������
	����� ��������� �� ���� ��������� �����
		����� 1. 
		����� 2. 
		����� 3.
		....
		����� �.
		���������� ���������, ��������������� ��������� ������
	����
*/