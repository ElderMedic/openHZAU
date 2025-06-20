#include <iostream>

using namespace std;

bool huiwen(char *p)
{
	char *q=p+strlen(p)-1;
	for(int i=0;i<strlen(p)/2;i++)
		if(*p!=*q)
			return false;
	return true;
}

void main()
{
	char ch[100];
	cin>>ch;
	if(huiwen(ch))
		cout<<"yes";
	else
		cout<<"no";
	cin.get();
	cin.get();
}

    return 0;
}
