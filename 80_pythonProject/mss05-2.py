import random

a = random.randrange(1, 7) # 1~6 끝값 +1
b = random.randrange(1, 7)
print("A 주사위 숫자는 %d입니다" % a)
print("B 주사위 숫자는 %d입니다" % b)

if a > b :
    print("a가 이겼습니다.")
elif a < b :
    print("b가 이겼습니다.")
elif a == b :
    print("무승부")
