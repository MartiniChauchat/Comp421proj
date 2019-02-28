import psycopg2
import csv
import numpy

conn = psycopg2.connect(dbname="cs421", user="cs421g64", password="zhanlang123", host='comp421.cs.mcgill.ca')

cur = conn.cursor()

cur.execute('SELECT * FROM drivers; ')

with open('worldcities.csv', 'r') as csvFile:
    cityReader = csv.reader(csvFile)
    idCity = [row[1] for row in cityReader if row[4] == 'India'][1:21]

with open('Indian-Male-Names.csv') as csvFile:
    nameReader = csv.reader(csvFile)
    idName = list(set([row[0] for row in nameReader if len(row[0].split()) == 2]))[1:21]

for tup in zip(idCity, idName):
    print(tup)
    phone = "".join([str(numpy.random.randint(low=0, high=9)) for j in range(10)])
    pds = "".join([str(numpy.random.randint(low=0, high=9)) for i in range(4)])
    cur.execute("insert into cities values (DEFAULT, %s, %s); ", (pds, tup[0]))
    cur.execute("select * from Cities where cityName = %s; ", (tup[0], ))
    cid = int(cur.fetchall()[0][0])
    cur.execute("insert into admins values (%s, %s, %s, %s, %s, %s, %s);", ("".join(tup[1].split()), tup[1].split()[0], tup[1].split()[1], 'male', "".join(tup[1].split()) + '@rideshare.io', phone, str(cid), ))

cur.execute("select * from cities; ")
cities = cur.fetchall()[:10]
cur.execute("select * from admins; ")
admins = cur.fetchall()[:10]
conn.commit()
conn.close()
print(cities)
print(admins)

