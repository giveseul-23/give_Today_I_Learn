for i in range(1, 10, 1): # 단수
    for j in range(2, 10, 1): # 곱수
        print("%d * %d = %2d" % (j,i,i*j),end="\t")
    print()