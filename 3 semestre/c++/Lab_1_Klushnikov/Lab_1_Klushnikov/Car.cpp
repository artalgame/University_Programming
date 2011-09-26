#include "stdafx.h"
#include "Car.h"

car::car(car &Car)
{
	speed = new int;
	weigth = new int;

	*weigth = Car.get_weigth();			
	*speed = Car.get_speed();
	petName = Car.get_PetName();
}

car::car(string PtName, int crSpeed, int CrWeigth)
{
	petName = PtName;

	speed = new int;
	weigth = new int;

	*speed = crSpeed;
	*weigth = CrWeigth;
}

car::car(void)
{
	petName = "";

	speed = new int;
	*speed = 0;

	weigth = new int;
	*weigth = 0;
}

car::~car(void)
{
	delete(speed);
	delete(weigth);
}

int car::get_weigth()
{
	return *weigth;
}

void car::set_weigth(int w)
{
	*weigth = w;
}

int car::get_speed()
{
	return *speed;
}

void car::set_speed(int s)
{
	*speed = s;
}

string car::get_PetName()
{
	return petName;
}

void car::set_PetName(string pName)
{
	petName = pName;
}

void car::carPrint(void)
{
	cout << "Name of car:\n";
	cout << get_PetName() << endl;
	cout << "Speed of car:\n";
	cout << get_speed() << endl;
	cout << "Weight of car:\n";
	cout << get_weigth() << endl;
}