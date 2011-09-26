// Lab_1_Klushnikov.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "Car.h"

int _tmain(int argc, _TCHAR* argv[])
{
	car *a = new car(), *b = new car("Jimmy", 20, 1500), *c = new car(*b);

	cout << "Car class with not parametrised constructor:" << endl;
	a->carPrint();
	cout << endl;

	cout << "Car class with parametrized constructor:" << endl;
	b->carPrint();
	cout << endl;

	cout << "Car class with copy constructor:" << endl;
	c->carPrint();
	cout << endl;


	c->set_speed(45);
	c->set_PetName("Dave");
	cout << "Modified car class with copy constructor:" << endl;
	c->carPrint();
	cout << endl;


	delete a;
	delete b;
	delete c;

	getchar();
	return 0;
}



