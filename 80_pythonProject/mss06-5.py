# 이등변 삼각형 만들기
'''
    *
   ***




'''

for i in range(1, 6, 1): # 행 갯수
    for j in range(1, 5 - i + 1, 1): # 빈 칸 출력 1 -> 4 2 -> 3 3 -> 1 ...
        print(" ", end="")
    for k in range (1, i*2-1,1): # 별 출력 1->1, 2->3, 3->5, 4->7...
        print("*", end="")
    print()