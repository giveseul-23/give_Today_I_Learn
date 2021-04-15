# 제곱 처리
# print(3**2)
# print(pow(3, 2))
def mss_calc(v1, v2):
    return v1 + v2, v1 * v2, v1 ** v2, pow(v1, v2)


a = int(input("숫자1 입력 : "))
b = int(input("숫자2 입력 : "))
r1, r2, r3, r4 = mss_calc(a, b)
print(a, '+', b, '=', r1)
print(a, '*', b, '=', r2)
print(a, '^', b, '=', r3)
print(a, '^', b, '=', r4)
