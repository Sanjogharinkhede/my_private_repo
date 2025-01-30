def fibo(n):
    a,b=0,1
    while a<=n:
        yield a
        a,b=b,a+b
    
def working_example():
    ite=iter(fibo(10))
    for i in ite:
        print(i)
working_example()