import json

data = '''{
  "name":"error",
  "age": 18,
  "phone": 17,
  "choices":["a","s","f"],
  "dictt":{"j":1,"k":1,"l":3}
}
'''
data = json.loads(data)
with open("formatted_data.json", "w") as file:
    json.dump(data, file, indent=4)
