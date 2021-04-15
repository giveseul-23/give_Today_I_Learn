hap = 0  # 생략시 3번줄 우변에서 에러
# for i in range(1, 10000001, 1):
#     hap += i
i = 1  # while 은 시작값 선언과 초기화 필수
while i <= 10:
    hap += i
    print(hap)
    i += 1 # while 은 루프 탈출 조건 필수

print("합계는 ", hap)