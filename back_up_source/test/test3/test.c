#include <stdio.h>



int main(){
	
	int i =1;


	//printf("if s>\n");
	if(i==1)
	{
	i++;
	}else if(i==0){

	i++;
	}else{

	i++;
	}
	
	do{

	i++;

	}while(i<3);
	//printf("if e>\n");


	//printf("while s>\n");
	while(i<10)
	{
		while(i<3)
		{
			i=i+2;
		}
	
	i++;
	}
	//printf("while e>\n");

	int j =0;
	int k =0;
	//printf("for s>\n");
	for(j=0; j<10; j++){
	
	i++;
		for(k=0; k<10; k++){
	
		i=i+10;
	
		}
	
	}
	//printf("for e>\n");

	return 0;
}
