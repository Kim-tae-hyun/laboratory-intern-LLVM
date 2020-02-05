#include <stdio.h>

int a=0;
int main(){

	int *i=&a;
	float num=3;
	float *b=&num;
	
		
	printf(" [%p %p ]\n",&i,&num);
	printf(" [%d %d ]\n",&i,&num);
	
	(*i)=2;
	return 0;
}
