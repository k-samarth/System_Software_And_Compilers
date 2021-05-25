%option noyywrap
%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<string.h>
	int num=0,op=0,top=-1,i;
	char stack[10],opr[10];
	int number[10];
%}

%%
[0-9]+ {number[num++]=atoi(yytext);}
"+" {opr[op++]='+';}
" " {opr[op++]=' ';}
"(" {stack[++top]='(';}
")" {if(stack[top]=='(' && top!=-1)
	top--;
	else
	 {
	   printf("Invalid expression");
	   exit(0);
	 }
     }
\n return 0; ;
%%
int main()
{
	printf("Name: K Samarth N Kamath USN: 4SF18CS055\n");
	printf("Enter expression\n");
	yylex();
	if(top==-1 && num==op+1)
	{
	printf("Valid expression\n");
	printf("Number of identifiers=%d\n",num);
	printf("Identifiers present are\n");
	for(i=0;i<num;i++)
	{
	printf("%d\t",number[i]);
	}
	printf("\n");
	printf("Number of operators=%d\n",op);
	printf("Operators present are\n");
	for(i=0;i<op;i++)
	{
	   printf("%c\t",opr[i]);
	}
	}
	else
	{
	printf("Invalid expression\n");
	}
	return 0;
}