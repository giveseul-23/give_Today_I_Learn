# 1부터 100까지 3배수만 합 구하기
hap = 0
for i in range(0, 101, 1):
    # print(i)
    if i % 3 == 0:
        continue # 인접 루프를 탈출하여 위로 이동
    hap += i

print(hap)