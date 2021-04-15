import random

# 조커는 1/100, 백도는 1/10 확률로 추출
a = random.randrange(1, 101) # 1~100


if a == 100: # 1/100확률
    print("🎁") # 특수기호 : window + (.)
elif a >= 90: # 1/10확률
    print("-1")
else:
    a %= 5 # 나머지는 0 ~ 4중 하나
    # if a == 0:
    #     print("도")
    # elif a == 1:
    #     print("개")
    # elif a == 2:
    #     print("걸")
    # elif a == 3:
    #     print("윷")
    # else:
    #     print("모")

    r = ["도", "개", "걸", "윷", "모"]
    print(r[a])



# switch
def switch(i):
    return {1: "도", 2: "개", 3: "걸", 4: "윷",5: "모",6: "빽도", 7: "조커"}.get(i)


print(switch(a))