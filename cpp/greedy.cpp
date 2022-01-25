#include<bits/stdc++.h>

using namespace std;


int main(void) {
    exchangeLeastCoin();
}

void exchangeLeastCoin() {
    int n = 1260;
    int cnt;

    int coinTypes[4] = {500,100,50,10};
    
    for (int i=0; i < 4; i++){
        cnt += n / coinTypes[i];
        n %= coinTypes[i];
    }

    cout << cnt << "\n";
}

void calculateTill1() {
    int n,k;
    int result;

    cin >> n >> k;

    while (true) {
        // N이 K로 나누어 떨어지는 수가 될 때까지 빼기
        int target = (n/k)*k;
        result += (n-target);
        n = target;
        // N이 K보다 작을 때 (더이상 나눌 수 없을 때) 반복문 탈출
        if (n < k) break;
        // K로 나누기
        n /= k;
    }
    // 마지막으로 남은 수에 대해서 1씩 빼기
    result += (n-1);
    cout << result << "\n";

}