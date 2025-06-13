import psycopg2

conn = psycopg2.connect(
    host="localhost",
    port=5432,
    database="postgres",
    user="postgres",
    password="mahesh@123"
)

cursor = conn.cursor()

# Inserting into all columns; id uses DEFAULT to auto-increment
insert_query = "INSERT INTO cars VALUES  (%s, %s, %s);"
values = ("Charlie", "Marketing", 58000)

cursor.execute(insert_query, values)
conn.commit()

cursor.close()
conn.close()
