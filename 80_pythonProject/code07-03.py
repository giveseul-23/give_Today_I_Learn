# 리스트 조작 함수들

a = [30, 10, 20]
print("리스트 초기 상태 : %s" % a) # [30, 10, 20]

a.append(40)
print(a) # [30, 10, 20 , 40]

print(a.pop()) # 40 마지막 끝 배열 팝! 꺼내기
print(a) # [30, 10, 20]

a.sort()
print(a) # [10, 20, 30] a 리스트 자체가 오름차순으로 변경

a.reverse()
print(a) # [30, 20, 10] a 리스트 자체가 차순 변경

a.insert(2, 222)  # 위치, 값
print(a) # 2번 인덱스에 222 추가

a.remove(222) # 특정 값 없애고 싶을때
print(a) # [30, 20, 10]

b = [30, 40, 50]
print(a + b) # [30, 20, 10, 30, 40, 50]
# a += b # 실제로 a를 늘이기 누적 연산도 가능하다.
a.extend(b) # 위와 결과 동일
print(a) # a는 그대로. 위에서는 더하기의 결과로만 보여주었을 뿐!

print(a.count(30)) # 특정 값의 개수

# c = a
# print(c) #  a 리스트 복사

c = a.copy() # 위와 동일
print(c)

c = sorted(a)
print(c)
print(a) # a 는 변동없음

a.clear() # a = []
print(a)