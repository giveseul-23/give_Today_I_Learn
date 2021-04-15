print("한행 또 한행")
print("한행 \n또 한행\n")

print("\t탭키\t연습\n")

print("1234\b56\n")  # 백스페이스 이스케이프문자

print("겹따옴표(\"  ) 쓰기")
print("홑따옴표(\'  ) 쓰기")
print("홑따옴표('  ) 쓰기")  # 예외적 허용
print("역슬래시(\\) 쓰기\n")

print("\n \t \" \' \\ 등을 그대로 출력")
print("\n \t \" \' \\ 등을 그대로 출력")
print(r"\n \t \" \' \\ 등을 그대로 출력", "\n")  # raw 의 약자(날 것)

print("123\n456\t\t789\b123\n\'456\\")

try:
    raise TypeError("hi")
except TypeError as e:
    print("\n예외가 발생했습니다", e)
    pass
