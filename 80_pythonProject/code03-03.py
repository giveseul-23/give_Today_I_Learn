b = True
i = 0
f = 0.
s = ""
print(type(b), type(i), type(f), type(s))

i = 200 + 200
print(i)
j = i + 100
print(j)
i = j = 300
print(i, j)
i = i + 100
print(i)
i += 100
print(i)
# ++i 파이썬은 증감연삱 X
k = 0
print(k)

my_var = 100
print(str(type(my_var)))
my_var += 0.1
print(str(type(my_var)))

if str(type(my_var)) == "<class 'float'>":
    print("ok")
