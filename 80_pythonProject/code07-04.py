# a1에 한행씩 리스트 생성해서 a2로 한줄씩 통째로 복사하는 다중리스트

a1 = [] # 1줄 (행)용 리스트
a2 = [] # 최종목표인 다중리스트(이차원)

# 다중리스트 생성
v = 1
for i in range(0, 3): # 3행
    for j in range(0, 4): # 4열
        a1.append(v)
        v += 1
    print(a1)
    a2.append(a1) # 배열 <- 배열
    print(a2)
    a1 = []
    
# 다중리스트 출력
for i in range(0, 3): # 3행
    for j in range(0, 4): # 4열
        print("$3d" % a2[i][j], end=" ")
    print()