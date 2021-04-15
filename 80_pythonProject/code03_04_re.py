print(2**3)
print(pow(2,3))
print(100 ** 100)
print(9/2)
print(9//2) #몫 구하기
print(9%2) #나머지 구하기
print(3.14E5)
print(0xff, 0o77, 0b1111) #16/8/2진수를 10진수로 변환
print(hex(255), oct(63), bin(15)) #10진수를 다른진수로 변환
print()

a = (100 == 100)
print(a) #True

b = "파이썬\n만세"
print(b)
b = """파이썬
만세"""
#"""(겹따옴표 세개) -> 화면에 보이는 그대로 출력
print(b)
b = "파이썬\
    만세"
print(b)