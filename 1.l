%option noyywrap
%{
	#include<stdio.h>
	int c=0,l=0;
%}

%%
. c++;
\n {l++;c++;return 0;};
%%
int main()
{
	printf("Name: K Samarth N Kamath  USN: 4SF18CS0\n");
	printf("Enter the input\n");
	yylex();
	printf("There were %d characters in %d lines\n",c,l);
	return 0;
}