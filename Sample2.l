%option noyywrap
%{
	#include<stdio.h>
	int dc=0,vc=0;
%}

%%
"int"|"float"|"char" dc++;
[a-zA-Z][a-zA-Z0-9]+ vc++;
.;
\n return 0;
%%
int main()
{
	printf("Name: K Samarth N Kamath  USN: 4SF18CS055\n");
	printf("Enter the input\n");
	yylex();
	printf("There are %d data types and %d variables\n",dc,vc);
	return 0;
}