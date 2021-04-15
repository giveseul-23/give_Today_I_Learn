# 누적합이 100을 넘는 순간의 카운터와 합 출력

hap = 0

# for 문 사용
# for i in range(1, 100, 1): # 101은 충분히 큰 값
#     hap += i
#     if hap > 100:
#         break

# while문 사용
# i = 0
# while hap <= 10:
#     i += 1
#     hap += i

i = 0
while True:
    hap += i
    i += 1
    if hap > 100:
        break




# 반복문을 돌고 난 후의 i 와 hap
print(i , hap)