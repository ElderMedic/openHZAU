#include <iostream>

using namespace std;

int main()
{
    int n;
    cin>>n;
    int result=number(n);
    if(result==-1)
        cout<<"no"<<endl;
    else
        cout<<"yes"<<endl;
    return 0;
}
int number (int a)
{
    int total=0,re=0;

    for(int i=0;i<a;i++)
    {
        total+=i;
        if(a==total)
        {
            re=a;
            break;
        }
        else
            re=-1;
    }
    return re;
}

    return 0;
}
