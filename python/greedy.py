import time

def till1_technique():
    start = time.time()
    print("n과 k를 입력하시오")
    n, k = map(int, input().split())
    result = 0

    while True:
        # N이 K로 나누어 떨어지는 수가 될 때까지 빼기
        target = (n // k) * k
        result += (n - target)
        n = target
        # N이 K보다 작을 때 (더 이상 나눌 수 없을 때) 반복문 탈출
        if n < k:
            break
        result += 1
        n //= k

    # 마지막으로 남은 수에 대하여 1씩 빼기
    result += (n-1)
    print(result)

    end = time.time()
    print(f"{end-start:.4f} sec")

def till1_my_solution():

    start = time.time()
    print("n과 k를 입력하시오")
    n, k = map(int, input().split())
    cnt = 0


    def option1(n):
        return n-1  

    def option2(n):
        return n/k

    while n > 1:
        if n % k != 0:
            n = option1(n)
        else:
            n = option2(n)
        cnt+=1

    print("%i번 소요"%cnt)
    
    end = time.time()
    print(f"{end - start:.5f} sec")

def count_min_coin_count(money):
    n = money
    count = 0

    array = [500,100,50,10]

    for coin in array:
        count += n // coin
        n %= coin
    
    print("%d 원을 거슬러주는 가장 작은 동전 갯수는 %d 이다"%(money,coin))

def main():
    if __name__ == "__main__":
        count_min_coin_count(1260)