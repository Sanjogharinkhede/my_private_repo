import csv
def read_csv():
    with open('data.csv', mode='r') as file:
        reader = csv.reader(file)
        print(list(reader))



def create_csv():
    new_row = [input("name: "), 33, input("city: ")]
    with open('data.csv', mode='a', newline='\n') as file:
        writer = csv.writer(file)
        writer.writerow(new_row)

def update_csv():
    rows=[]
    flag=False
    with open('data.csv', mode='r') as file:
        reader = csv.reader(file)
        rows=list(reader)
    name=input("name: ")
    age=input("age: ")

    for row in rows:
        if row[0] == name:
            row[1] = age
            flag=True
    if flag:
        with open('data.csv', mode='w', newline='') as file:
            writer = csv.writer(file)
            writer.writerows(rows)


def delete_csv():
    rows = []
    with open('data.csv', mode='r') as file:
        reader = csv.reader(file)
        rows=list(reader)
    name = input("name: ")
    rows = [row for row in rows if row[0] != name]

    with open('data.csv', mode='w', newline='') as file:
        writer = csv.writer(file)
        writer.writerows(rows)

# read_csv()
# create_csv()
# update_csv()
# delete_csv()