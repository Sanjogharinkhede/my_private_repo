import json

import requests

def get_response(url):
    response = requests.get(url)

    print(type(response))
    print(type(response.json()))
    print(json.loads(response.json()))

    disc={}
    if response.status_code==200:
        disc={dt["title"]:dt["price"]*0.9 for dt in response.json()['products']}
    return  disc

def post_response(url):
    # resp=
    pass

def rating(url,rating):
    response = requests.get(url)
    ls=[]
    if response.status_code == 200:
        ls=[dt['title'] for dt in response.json()['products'] if dt['rating']>rating]
    return ls


# print(get_response('https://dummyjson.com/products'))
ans = rating('https://dummyjson.com/products',3)
for i in ans:
    print(i,end=", ")