import sqlite3, random, mysql.connector, datetime, base64

"""
1. fetchall()
• Purpose: Fetches all rows of the result set.
• Example:
 
cursor.execute("SELECT * FROM students")
rows = cursor.fetchall()
for row in rows:
    print(row)
 
2. fetchone()
• Purpose: Fetches the next row of the result set.
• Example:
 
cursor.execute("SELECT * FROM students")
row = cursor.fetchone()
print(row)
 
3. fetchmany(size)
• Purpose: Fetches the next size number of rows from the result set.
• Example:
 
cursor.execute("SELECT * FROM students")
rows = cursor.fetchmany(2)
for row in rows:
    print(row)
 
4. description
• Purpose: Returns the column names of the result set.
• Example:
 
cursor.execute("SELECT * FROM students")
columns = [column[0] for column in cursor.description]
print(columns)
 
5. rowcount
• Purpose: Returns the number of rows affected by the last query.
• Example:
 
cursor.execute("SELECT * FROM students")
print(cursor.rowcount)
 
These are the most commonly used fetch-related methods and attributes in SQLite with Python.
"""


def set_conn():
    # conn = sqlite3.connect('library_management.db', autocommit=False)
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="123456",
        database="library_management",
        autocommit=False
    )
    print("conn", conn)
    return conn


def get_cursor():
    conn = set_conn()
    print("conn on cur", conn)
    cursor = conn.cursor()
    print('cur', cursor)
    return conn, conn.cursor()


def create_table(cursor):
    cursor.execute("DROP TABLE IF EXISTS Users;")
    # cursor.execute(query)
    create_query = ('''CREATE TABLE IF NOT EXISTS Users( 
                    UserID INTEGER PRIMARY KEY AUTOINCREMENT,
                    Username VARCHAR(50) NOT NULL UNIQUE,
                    Name VARCHAR(100) NOT NULL,
                    Email VARCHAR(100) NOT NULL UNIQUE, 
                    Password VARCHAR(255) NOT NULL,
                    Phone VARCHAR(15) NOT NULL UNIQUE,
                    created_at bigint, 
                    updated_at BIGInt
                    );''')

    print(cursor.execute(create_query), "created")


def get_all_data_list(cursor):
    cursor.execute("Select * from users")
    return cursor.fetchall()


def get_first_data(cursor):
    cursor.execute("Select * from users")
    return cursor.fetchone()


def get_data_by_size(cursor, size, query="Select * from users"):
    cursor.execute(query)
    return cursor.fetchmany(size)


def get_data_by_query(cursor, query):
    cursor.execute(query)
    return cursor.fetchall()


def get_unix_time():
    present_date = datetime.datetime.now()
    unix_timestamp = datetime.datetime.timestamp(present_date) * 1000
    return unix_timestamp


def insert_into_users(cursor):
    name = input("Enter name: ")
    email = input("Enter email: ")
    phone = input("Enter phone: ")
    psw = base64.b64encode(input("Enter password: ").encode('utf-8'))
    username = name + str(random.randint(1, 14724))
    time = get_unix_time()

    query = (f"""Insert Into Users(UserID,Username,Name,Email,Password,Phone,created_at,updated_at) 
    values(NULL,'{username}','{name}','{email}','{psw}','{phone}','{time}',NULL)""")
    cursor.execute(query)
    print(psw)
    return cursor.rowcount


def update_into_users(cursor, update_column, user_id):
    query = f""" update users set {update_column} where userID={user_id}"""
    cursor.execute(query)
    return cursor.rowcount


def delete_user(cursor, user_id):
    if user_id:
        cursor.execute(f""" delete from users where userID={user_id} """)
        return cursor.rowcount
    else:
        raise ValueError("User ID not Found")


def truncate_user_table(cursor):
    cursor.execute("Truncate Table Users")


def drop_user_table(cursor):
    cursor.execute("Drop Table Users")


def working_example():
    try:
        conn, cursor = get_cursor()
        print("Welcome to user CRUD")
        while True:
            print("""
                1. Insert  
                2. Update  
                3. Delete  
                4. Get All  
                5. Get One 
                6. Get By Size
                7. Truncate All users
                8. Create User Table
                9. Drop User Table
                10.Get data by query
                
                Press any other key to Exit
            """)
            choice = int(input("Enter Your Choice: "))
            match choice:
                case 1:
                    ct = insert_into_users(cursor)
                    if ct == 1:
                        conn.commit()
                case 2:
                    ct = update_into_users(cursor, input("Enter update column and value (e.g., Name='John'): "),
                                           int(input("Enter userID: ")))
                    if ct == 1:
                        conn.commit()
                case 3:
                    ct = delete_user(cursor, int(input("Enter user ID: ")))
                    if ct == 1:
                        conn.commit()
                case 4:
                    print(get_all_data_list(cursor))
                case 5:
                    print(get_first_data(cursor))
                case 6:
                    print(get_data_by_size(cursor, int(input("Enter Size: "))))
                case 7:
                    truncate_user_table(cursor)
                case 8:
                    create_table(cursor)
                case 9:
                    drop_user_table(cursor)
                case 10:
                    print(get_data_by_query(cursor, input("Enter Full query: ")))
                case _:
                    break
    except Exception as error:
        print("Error:", error)
    finally:
        conn.close()


working_example()
