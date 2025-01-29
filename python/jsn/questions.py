import json


def add_data():
    with open("formatted_data.json", "r") as file:
        data = json.load(file)
        new_friend = {"name": "King", "age": 99}
        data["friends"].append(new_friend)
    with open("formatted_data.json", "w") as file:
        json.dump(data, file, indent=4)
    print("Added")


def read_data():
    with open("formatted_data.json", "r") as file:
        data = json.load(file)
    print(json.dumps(data, indent=4))


def update_data():
    with open("formatted_data.json", "r") as file:
        data = json.load(file)
        data["name"] = "sachin"
        data["age"] = 88
    with open("formatted_data.json", "w") as file:
        json.dump(data, file, indent=4)
    print("Modified")


def delete_data():
    with open("formatted_data.json", "r") as file:
        data = json.load(file)

    data["friends"] = [friend for friend in data["friends"] if friend["name"] != "Bob"]

    with open("person_data.json", "w") as file:
        json.dump(data, file, indent=4)
    print("Friend deleted successfully!")

# add_data()
# read_data()
# update_data()
# delete_data()