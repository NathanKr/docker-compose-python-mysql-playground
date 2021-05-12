from datetime import datetime
import mysql.connector
import time


now = datetime.now()
print(f' ###########  hello python start -{now}-')

mydb = None

while True:
  try:
    mydb = mysql.connector.connect(
      # host is db container name !!!
      host= 'docker-compose-python-mysql-playground_dc_db_service_1', 
      user = "root",
      password="123abc",
      database = 'db1'
    )   
    print('connected to the db')
    break

  except Exception as e:
      print(e)
      time.sleep(2)


print(f'mydb : {mydb}')

mycursor = mydb.cursor()
mycursor.execute("SELECT * FROM employees")
myresult = mycursor.fetchall()

for x in myresult:
  print(x)


print(f' ########### hello python end -{now}-')
