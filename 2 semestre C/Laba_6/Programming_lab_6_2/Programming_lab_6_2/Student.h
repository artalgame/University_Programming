#include <malloc.h>

#ifndef NAMELENGTH
#define NAMELENGTH 50
#endif

class Student
{
public:
	char FirstName[NAMELENGTH], LastName[NAMELENGTH], MiddleName[NAMELENGTH];
	int SocialAllowance;
	float AverageScore;
	bool SchCounUniver, HavePetition;

	Student()
	{
	}

	Student(char *FName, char* LName, char* MName, float AvScore) 
	{
		sprintf(FirstName, "%s", FName);
		sprintf(LastName, "%s", LName);
		sprintf(MiddleName, "%s", MName);
		if ((AvScore <= 10) && (AvScore >= 0))
			AverageScore = AvScore;
		else 
		{
			AverageScore = 0;
			puts("Input correct average(>= 0 and <= 10)");
		}
		SocialAllowance = 0;
		SchCounUniver = HavePetition = false;
		next = prev = NULL;
	}

	~Student() 
	{
	}

	Student *next, *prev;

	void EditScore(float newScore); 
	void EditFullName(char *FName, char* LName, char* MName); 
	void EditSchCountUniversity(bool newSchCountUniver); 
	void EditSocialAllowance(int NewSocialAllow); 
	char* ToString(void); 
	int Scholarship(void); 
	float Student::Score(void); 
};