#include<stdio.h>

int b=30;
int c=10;
int gl=11;
static int sa = 11;
float iii = 3;
const int iia = 15;

int main(void){

	int a = 13;
	
	int* iNumber = &b;
	int* pointer = &a;

	int** pp=&pointer;
	int** pi =&iNumber;

	const int* globalpoint;
	int* access = &sa;

	
	(*iNumber)++;
	(*pointer)++;
	(*iNumber)--;
	pointer = &c;
	
	(*pointer)++;
	iNumber = &a;
	globalpoint=&iia;
	(*access)++;
	pointer =&b;

	return 0;
}
