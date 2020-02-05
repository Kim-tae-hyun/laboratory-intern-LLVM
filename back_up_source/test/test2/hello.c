#include <stdio.h>

int number =9;

//void addnum(void);

int main()
{
	int *b=&number;

	(*b)++;


	return 0;
}
/*
void addnum(void){

	number++;
}*/
