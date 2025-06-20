#include <iostream>

using namespace std;

void fib(int s)
{
	int d=1,f=1,sum=0,n=1,t=0;
	 while(n<s)
	 {
		n++;
		t=f;
        f=d;
        d+=t;
        sum=d+f;
	}
	cout<<"第"<<s<<"个月兔子的总对数为"<<sum-d<<endl;
}
int main()
{
	int s;
    cin>>s;
    if(s!=1)
		fib(s);
	else
		cout<<"第1个月兔子的总对数为1"<<endl;
	return 0;
}
