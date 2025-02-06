import sqlite3,random

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

insrt=f"Insert Into Users(UserID,Username,Name,Email,Password,Phone,created_at,updated_at) values(NULL,'sanjog_{random.randint(1,1147387)}','{input("name")}','sanjog{random.randint(1,1147387)}@abc.com','9823w77',{random.randint(100000000,9999999999)},'1234567890',1234567890)"
# insrt2=f"Insert Into Users(UserID,Username,Name,Email,Password,Phone,created_at,updated_at) values(NULL,'sanjog_{random.randint(1,1147387)}','{input("name")}','sanjog{random.randint(1,1147387)}@abc.com','98223w77',{random.randint(100000000,9999999999)},'1274567890',1934567890)"

try:
    conn = sqlite3.connect('library_management.db',autocommit=False)
    cursor = conn.cursor()
    print(conn, cursor)
    print("==========================================")
    # query='SELECT * FROM Books'
    # cursor.execute(query)

    # cursor.execute("DROP TABLE IF EXISTS Users;")
    # print("Old Users table dropped.")

   
    # cursor.execute(create_query)

    # print(cursor.execute(create_query),"connected and created")

    print(cursor.execute(insrt),"inserted")
    print("==========================================")

    # print(cursor.execute(insrt2),"inserted2")
    # print("==========================================")



    sel = 'select * from users Order By name Asc;'
    cursor.execute(sel)


    result = cursor.fetchall()
    print("Select results:",result)
    print("==========================================")

    update="Update Users set name='Vickey' where userID=1"
    print(cursor.execute(update),"Updated")

    print("==========================================")


    cursor.execute(sel)
    result2 = cursor.fetchall()
    print("Select results2:",result2)
    print("==========================================")

    cursor.execute(sel)
    result3 = cursor.fetchone()
    print("Select results3:", result3)
    print("==========================================")

    cursor.execute(sel)
    result4 = cursor.fetchmany(2)
    print("Select results4:", result4)
    print("==========================================")



    conn.commit()

    cursor.execute("Select name,phone,email From Users where name like 'd%'")
    result4 = cursor.fetchmany(3)
    print("Select results4:", result4)
    print("==========================================")

    cursor.execute("Select name,phone,email From Users where name not like 'd%'")
    result5 = cursor.description
    print("Select results5:", result5)
    print("==========================================")

    cursor.execute("Select * From Users where name like 'd%'")
    result5 = cursor.rowcount
    print("Select results5:", result5)
    print("==========================================")


    cursor.close()
    conn.close()
    print("====================CLOSED======================")


except sqlite3.Error as error:
    print(f'Error  {error}')
