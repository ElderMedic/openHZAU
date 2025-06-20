#include <iostream>

using namespace std;

void mystr(char c,int n,char *p)
{
	for(int i=1;i<=n;i++)
		cout<<c<<endl;
	return;
}


int main()
{
    char c;
	char *p;
	p=&c;
	int n;
	cin>>c;
	cin>>n;
    mystr(c,n,p);
	return 0;
}
