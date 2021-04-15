# 초기화 해주고 실행
hap = 0 # 생략시 3번줄 우변에서 에러
for i in range(1, 100000001, 1):
    hap += i
    # hap = hap + i

print(hap)