#include "stdafx.h"
#include <string>
#include <iostream>
using namespace std;


class car
{
private:
	string petName;
	int *speed, *weigth;

public:
	car(void);

	car(string PtName, int crSpeed, int CrWeigth);

	car(car &Car);

	~car(void);

	int get_weigth();

	void set_weigth(int w);
	
	int get_speed();

	void set_speed(int s);

	string get_PetName();

	void set_PetName(string pName);

	void carPrint(void);
};