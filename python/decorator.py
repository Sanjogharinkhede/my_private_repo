from functools import reduce


def dec(fun):
    def wrapper(*args,**kargs):
        print("Before")
        fun(*args,**kargs)
        print("After")
    return wrapper

@dec
def hello(one,two):
    print("hello")
    print("one" , one)
    print("two" , two)
hello('first_arg','two_arg')

print("--------------------------------")
def decorator(func):
    def wrapper(a, b):
        print(a,b)
        res = func(a, b)
        print(res)
        return res
    return wrapper

@decorator
def fun(a, b):
    return a + b
fun(5, 7)

sq=lambda a:a**2
print(sq(4))

is_even=lambda a:a%2==0
num=17

if(is_even(num)):
    print("even")
else:
    print("odd")


ans=list(map(lambda x:x+10,[1,7,47,87,75,44,5,4,2]))
print(ans)

q=["Hello","world","How","Are", "You","!"]
ans2=dict(map(lambda x: (x.upper(),len(x)),q))
print(ans2)

ans3=tuple(map(lambda x:x+1,[1,7,47,87,75,44,5,4,2]))
print(ans3)

ans4=reduce(lambda x,y:f"{x+' '+y}",q)
print(ans4)

q=["Hello","world","How","Are", "You","!"]
ans2=list(filter(lambda x: len(x)>3,q))
print(ans2)


q2=[0,1,5,2,4,6,7,24,22]
ans5=list(filter(lambda x: x>3,q2))
print(ans5)
ans6=list(filter(lambda x: x%2!=0,q2))
print(ans6)

import functools
q2=[0,1,5,2,4,6,7,24,22]
sm=functools.reduce(lambda x,y:x+y,q2)
print(sm)
mx=functools.reduce(lambda x,y:x if x>y else y,q2)
print(mx)

q=["Hello","world","How","Are", "You","!"]
conc=functools.reduce(lambda x,y:f"{x} {y}",q)
print(conc)
