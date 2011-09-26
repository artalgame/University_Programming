#include "stdafx.h"
#include "Student.h"
#include <math.h>

#define NominalGrant 181000
#define SCU 135000

#ifndef NAMELENGTH
#define NAMELENGTH 50
#endif


int ScholarsipPrice[11] = {0, 0, 0, 0, 0, 78862, 94634, 94634, 110405, 126179, 126179};

float Student::Score(void)
{
	return AverageScore;
}

void Student::EditScore(float newScore)
{
	if ((newScore <= 10) && (newScore >= 10))
		AverageScore = newScore;
	else 
		puts("Input correct average(>= 0 and <= 10)");
}

void Student::EditFullName(char *FName, char* LName, char* MName)
{
	sprintf(FirstName, "%s", FName);
	sprintf(LastName, "%s", LName);
	sprintf(MiddleName, "%s", MName);
}

void Student::EditSchCountUniversity(bool newSchCountUniver)
{
	SchCounUniver = newSchCountUniver;
}

void Student::EditSocialAllowance(int NewSocialAllow)
{
	if (NewSocialAllow >= 0)
		SocialAllowance = NewSocialAllow;
	else 
		puts("Incorrect social allowance");
}

char* Student::ToString(void)
{	
	char *res = new char[601];
	sprintf(res, "%s %s %s, average score: %.2f\nsocial allowance: %d,Scholarship count university: %s,\ndepartment petition: %s", FirstName, LastName, MiddleName, AverageScore,				SocialAllowance, SchCounUniver?"found":"not found", (HavePetition)?"Petition found":"Not found");
	return res;
}

int Student::Scholarship(void)
{
	return (ScholarsipPrice[(int) floor(AverageScore)] + SocialAllowance + (SchCounUniver?SCU:0) + ((HavePetition)?NominalGrant:0)); 
}


