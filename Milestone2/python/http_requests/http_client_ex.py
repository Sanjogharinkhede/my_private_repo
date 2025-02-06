import http.client, json


def get_conn(base_url):
    conn = http.client.HTTPSConnection(base_url)
    print(conn)
    return conn


def get_ht_response(connection, end_point):
    try:
        connection.request("GET", end_point)
        res = connection.getresponse()
        #
        print(res.status, res.reason)
        #
        if res.status==200:
            data = res.read().decode('utf-8')
            # data=json.loads(data)
            # print(data)
            # for i in data:
            #     if i['id'] % 2==0:
            #         print(i)

            # print(data)
            for i in json.loads(data):
                # print(i)
                print(i['name'],":",i['email'])
        else:
            print("FAT GAYA")
    except json.JSONDecodeError as e:
        print("json error",e)
    except Exception as e:
        print(e)
    finally:
        connection.close()


def get_ht_post(connection, end_point):
    headers = {
        # "User-Agent": "MyClient/1.0",  # Set a meaningful User-Agent
        # "Authorization": "Bearer your_token_here",  # Add a real token if needed
        "Content-Type": "application/json"  # Use JSON since your data is in JSON format
    }
    data = {
        "email": "sd1010@gmail.com",
        "firstName": "abc",
        "gender": "M",
        "password": "abc@124",
        "role": "ADMIN",
        "lastName":"dcf",
        "city":"Banglore",
        "country":"India",
        "state":"Madhya pradesh"
    }
    connection.request("POST", end_point,body=json.dumps(data),headers=headers)
    res = connection.getresponse()

    print(res.status, res.reason)
    response_data = res.read().decode('utf-8')
    print("====>",response_data)

    try:
        response_json = json.loads(response_data)
        print(response_json)
    except json.JSONDecodeError:
        print("Invalid JSON.")


def working_example():
    # conn=get_conn('dummyjson.com')
    # conn=get_conn('jsonplaceholder.typicode.com')
    # get_ht_response(conn,"/users")
    conn = get_conn("shoppersstack.com")
    get_ht_post(conn, "/shopping/admin")


working_example()
