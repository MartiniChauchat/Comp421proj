# Script that populates tables Cities and Admins with real-world data

import psycopg2
import csv
import numpy

conn = psycopg2.connect(dbname="cs421", user="cs421g64", password="zhanlang123", host='comp421.cs.mcgill.ca')

cur = conn.cursor()

cur.execute('SELECT * FROM drivers; ')

with open('worldcities.csv', 'r') as csvFile:
    cityReader = csv.reader(csvFile)
    idCity = [row[1] for row in cityReader if row[4] == 'India'][1:51]

with open('Indian-Male-Names.csv') as csvFile:
    nameReader = csv.reader(csvFile)
    idName = list(set([row[0] for row in nameReader if len(row[0].split()) == 2]))[1:51]

for tup in zip(idCity, idName):
    print(tup)
    phone = "".join([str(numpy.random.randint(low=0, high=9)) for j in range(10)])
    # Insert cities 
    cur.execute("INSERT into Cities values (DEFAULT, %s); ", (tup[0], ))
    cur.execute("SELECT * from Cities where cityName = %s; ", (tup[0], ))
    # cid = int(cur.fetchall()[0][0])

    # Insert admins
    cur.execute("INSERT into Admins values (%s, %s, %s, %s, %s);", 
        ("".join(tup[1].split()), tup[1].split()[0], tup[1].split()[1], "".join(tup[1].split()) + '@rideshare.io', phone, ))

cur.execute("SELECT * from Cities; ")
cities = cur.fetchall()[:10]
cur.execute("SELECT * from Admins; ")
admins = cur.fetchall()[:10]
conn.commit()
conn.close()
print(cities)
print(admins)

