#include<stdio.h>
int main(){
    int N,i,j,k;
    for(scanf("%d",&N),i=N-60;k-N&&i<N;i++)
        for(k=j=i;j;j/=10)k+=j%10;
    printf("%d",k-N?0:i-1);
}