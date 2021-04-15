print("안녕\n")

print("100")
print(100)
print("%d\n" % 100)

print(100, 200)
print("%d, %d" % (100, 200))
print(100, 300, sep='와 ')

print(100, "+", 200, "=", 100 + 200)
print("%d + %d = %d" % (100, 200, 100 + 200))
print(100/200)
print(int(0.5))
print("%d / %d = %f" % (100, 200, 100 / 200))
print("%d / %d = %.1f" % (100, 200, 100 / 200))

print("%d" % 123)
print("%5d" % 123)  # 전체 자릿수
print("%05d" % 123)  # 전체 자릿수, 공백은 0으로 채움
print("%-5d" % 123)
print()

print("%f" % 123.45)  # 소수점 뒤 6자리
print("%.2f" % 123.45)
print("%07.1f" % 123.45)  # 7은 소숫점을 포함한 전체자릿수
print()

print("%s" % "Python")
print("%10s" % "Python")
print()

print("%d %5d %05d" % (123, 456, 789))
print("{0:d} {1:5d} {2:05d}".format(123, 456, 789))
print("{1:d} {2:5d} {0:05d}".format(123, 456, 789))
