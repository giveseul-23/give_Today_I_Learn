''' 딕셔너리 = { 키:값,,,} '''

d = {'학번' : 1234, '이름' : "홍길동", "학부" : "ICT"} # 생성시 { }
print(d)
print(d['이름']) # 홍길동  / 리스트[] 형태로 사용
print(d. get('이름')) # 위와 결과 같음
# print(d["전화"]) # 없는 키 검색시 오류
print(d. get('전화')) # 없는 키 검색시 None 반환 (추천)

''' 추가하기 '''
d['전화'] = "010"
print(d)

''' 수정하기 '''
d['이름'] = "고길동"
print(d)

''' 유니크 키값 '''
d2 = {'학번' : 1234, '이름' : "홍길동", "학번" : "ICT"} # 선언시 오류 안남
print(d2) # 중복키 있을시 출력시 최종값으로 통일

''' 키 또는 값들만 나열 '''
print(d.keys()) # 키값만 나열 dict_keys(['학번', '이름', '학부', '전화'])
print(list(d.keys())) # dict_keys 제거 ['학번', '이름', '학부', '전화']
print(d.values()) # 값들만 나열 dict_values([1234, '고길동', 'ICT', '010'])
print(list(d.values())) # dict_values 제거 [1234, '고길동', 'ICT', '010']

''' 검색결과 T/F '''
print('이름' in d) # 결과를 True & False 로 반환
print('유나' in d)