#include <stdio.h>

int number=1;
void aa(){
printf("load 2nd\n");
 int * ptr = &number;

printf("store 2nd\n");

 (*ptr)++;

}
int main(){
	
	printf("%d %p\n",&number,&number);
	int* ptr = &number;
	printf("* %d %p\n",ptr,ptr);
	printf("store 1st\n");

		*ptr=2;

	printf("func call\n");

		aa();

	return 0;
}
