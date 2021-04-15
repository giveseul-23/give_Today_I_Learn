# 파이선은 do while이 없는 대신  while 무한루프 패턴으로 이용

# 전형적인 while 문
# a = input("계속 할까요? (y/n) ")
# while a != "n":
#     a = input("계속 할까요? (y/n) ")

# 무한루프로 do while 대신함
while True:
    a = input("계속 할까요? (y/n) ")
    if a == "n":
        break # 루프를 탈출하여 아래로