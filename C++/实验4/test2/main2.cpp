#include <iostream>

using namespace std;

void countdown2020(int y,int m,int d)
{
    int x;
     if(m==7)
	{
		x=27-d;
		cout<<endl<<"距离2020东京奥运会还有"<<x<<"天。";
	}
	else
	{
		switch(m)
		{
		case 1:x=31-d+29+31+30+31+30+27;break;
		case 2:x=29-d+31+30+31+30+27;break;
		case 3:x=31-d+30+31+30+27;break;
		case 4:x=30-d+31+30+27;break;
		case 5:x=31-d+30+27;break;
		case 6:x=30-d+27;break;
		}
		cout<<endl<<"距离2020东京奥运会还有"<<x<<"天。";
	}

}
void countdown2019(int y,int m,int d)
{
    int x;
	{
		switch(m)
		{
		case 1:x=365-d+208;break;
		case 2:x=365-d-31+208;break;
		case 3:x=365-d-31-28+208;break;
		case 4:x=365-d-31-28-31+208;break;
		case 5:x=365-d-31-28-31-30+208;break;
		case 6:x=365-d-31-28-31-30-31+208;break;
		case 7:x=365-d-31-28-31-30-31-30+208;break;
        case 8:x=365-d-31-28-31-30-31-30-31+208;break;
        case 9:x=365-d-31-28-31-30-31-30-31-31+208;break;
        case 10:x=365-d-31-28-31-30-31-30-31-31-30+208;break;
        case 11:x=365-d-31-28-31-30-31-30-31-31-30-31+208;break;
        case 12:x=365-d-31-28-31-30-31-30-31-31-30-31-30+208;break;
		}
		cout<<endl<<"距离2020东京奥运会还有"<<x<<"天。";
	}

}
void countdown2018(int y,int m,int d)
{
    int x;
	{
		switch(m)
		{
		case 1:x=365-d+208;break;
		case 2:x=365-d-31+208;break;
		case 3:x=365-d-31-28+208;break;
		case 4:x=365-d-31-28-31+208;break;
		case 5:x=365-d-31-28-31-30+208;break;
		case 6:x=365-d-31-28-31-30-31+208;break;
		case 7:x=365-d-31-28-31-30-31-30+208;break;
        case 8:x=365-d-31-28-31-30-31-30-31+208;break;
        case 9:x=365-d-31-28-31-30-31-30-31-31+208;break;
        case 10:x=365-d-31-28-31-30-31-30-31-31-30+208;break;
        case 11:x=365-d-31-28-31-30-31-30-31-31-30-31+208;break;
        case 12:x=365-d-31-28-31-30-31-30-31-31-30-31-30+208;break;
		}
		cout<<endl<<"距离2020东京奥运会还有"<<x+365<<"天。";
	}

}
void countdown2017(int y,int m,int d)
{
    int x;
	{
		switch(m)
		{
		case 1:x=365-d+208;break;
		case 2:x=365-d-31+208;break;
		case 3:x=365-d-31-28+208;break;
		case 4:x=365-d-31-28-31+208;break;
		case 5:x=365-d-31-28-31-30+208;break;
		case 6:x=365-d-31-28-31-30-31+208;break;
		case 7:x=365-d-31-28-31-30-31-30+208;break;
        case 8:x=365-d-31-28-31-30-31-30-31+208;break;
        case 9:x=365-d-31-28-31-30-31-30-31-31+208;break;
        case 10:x=365-d-31-28-31-30-31-30-31-31-30+208;break;
        case 11:x=365-d-31-28-31-30-31-30-31-31-30-31+208;break;
        case 12:x=365-d-31-28-31-30-31-30-31-31-30-31-30+208;break;
		}
		cout<<endl<<"距离2020东京奥运会还有"<<x+365+365<<"天。";
	}

}

int CountDown(int year,int month,int day)
{
    switch(year)
    {
        case 2020:countdown2020(year, month, day);break;
        case 2019:countdown2019(year, month, day);break;
        case 2018:countdown2018(year, month, day);break;
        case 2017:countdown2017(year, month, day);break;
    }
}

int main()
{
    int y,m,d;
    cin>>y>>m>>d;
    CountDown(y,m,d);

    return 0;
}
