one = ["2"]
two = ["1", "3", "7", "8", "10", "12"]
three = ["4", "5", "6", "9", "11"]

lastDate = ["28", "31", "30"]

month = input("달을 입력하세요 : ")

# if month in one : #파이썬은 switch 없음
#     print(lastDate[0])
# elif month in two :
#     print(lastDate[1])
# elif month in three :
#     print(lastDate[2])
# else :
#     print("잘못입력하였습니다.")

a = int(input("달을 입력하세요 : "))

#딕셔너리 사용하기
#def : 함수정의
def switch(i) : #딕셔너리 이용해 스위치를 흉내낼수도 있다
    return {1:31, 2:28, 3:31}.get(i, -1) #키값에 해당하는게 없으면

print(switch(a))