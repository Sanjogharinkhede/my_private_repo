def evenNumber(n):
    if n<0:
        raise ValueError("Please Provide Positive Values only")
    for i in range(1,n):
        if i%2==0:
            yield i
        i+=1

for i in evenNumber(0):
    print(i)