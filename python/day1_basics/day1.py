names=[i**2 if i%2==0 else i for i in range(20) ]
print(names)

q=['apple','banana','cherry']
print([x.upper() for x in q])

st="some VALue is There"
print([x for x in st if x.lower() in ['a','e','i','o','u']])


celsius=[15,17,26,77,4,38]
fa=[(x*1.8)+32 for x in celsius]
print(fa)

# An iterator is an object that can be iterated upon,
# meaning that you can traverse through all the values.
#__iter__(): returns the iterator object
#__next__(): return next object in the sequence

iterator=iter(celsius)
print(iterator)
print(next(iterator))
print(next(iterator))
print(next(iterator))


x=[[1,2],[4,3],[3,3,5]]
print([item for row in x for item in row])
print([row for item in x for row in item])
print([x[row][item] for row in range(len(x)) for item in range(len(x[row]))])


print([char + num for char in "AB" for num in [1, 2]])

print([[char, num] for char in "AB" for num in [1, 2]])

print([(char, num) for char in "AB" for num in [1, 2]])

# print([f"(char)(num)" for char in "AB" for num in [1, 2]])