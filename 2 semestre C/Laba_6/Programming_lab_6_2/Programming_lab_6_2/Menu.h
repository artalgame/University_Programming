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
Меню:
	меню работы с основным списком студентов:
		ввод информации о студенте
		работа с основным списком студентов
			изменение информации о студенте по номеру
			распечатка списка студентов,с которым идет работа
			удаление струдента по номеру в списке
			расчет стипендии на студента по его номеру
	печать ведомости:
		Основная ведомость. с общей суммой денег
		список, получающих повышенную стипендию
		список людей, получающих соц надбавку
	поиск студентов по всем возможным полям
		поиск 1. 
		поиск 2. 
		поиск 3.
		....
		поиск н.
		распечатка студентов, удовлетворяющих критериям поиска
	хелп
*/