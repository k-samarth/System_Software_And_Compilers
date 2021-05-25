%option noyywrap
%{
	#include<stdio.h>
	int id=0,op=0,top=-1,i,num=0;
	char opr[10],stack[10],iden[10][10];
%}
id  [_a-zA-Z][_a-zA-Z0-9]*
num [0-9]+

%%
{id}  {strcpy(iden[id],yytext);
         id++;
      }
{num}    {num++;}
"+"      {opr[op++]='+';}
"-"      {opr[op++]='-';}
" "       {opr[op++]=' ';}
"/"      {opr[op++]='/';}
"("      {stack[++top]='(';}
")"      {if(stack[top]=='('&& top!=-1)
          top--;
	  else
	{ 
	 printf("Invalid expression\n");
	   exit(0);
	}
	}
	"\n"   {return 0;}
	.   {printf("Invalid expression (it has special character) \n");
	     exit(0);
	    } 

%%
int main()
{
	printf("Name: K Samarth N Kamath   USN: 4SF18CS055 \n");
	printf("Enter the expression: \n");
	yylex();
	if(top==-1 && id+num==op+1)
	{
	printf("Valid expression\n");
	printf("\n No. of identifiers = %d and are: \n",id);
	for(i=0;i<id;i++)
		printf("%s\t",iden[i]);
	printf("\n No. of operator = %d and are: \n",op);
	for(i=0;i<op;i++)
		printf("%c\t",opr[i]);
	}
	else
		printf("Invalid expression\n");
}