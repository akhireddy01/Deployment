import psycopg2

# Replace with your PostgreSQL credentials
host = "localhost"
port = 5432
user = "postgres"
password = "mahesh@123"
database = "postgres"  # Connect to a default DB like 'postgres'

try:
    # Connect to the PostgreSQL server
    conn = psycopg2.connect(
        host=host,
        port=port,
        user=user,
        password=password,
        database=database
    )
    conn.autocommit = True  # Required for listing databases

    # Create a cursor object
    cursor = conn.cursor()

    # Query to get database names (excluding templates)
    cursor.execute("SELECT datname FROM pg_database WHERE datistemplate = false;")
    rows = cursor.fetchall()

    print("Databases:")
    for row in rows:
        print(" -", row[0])

    # Clean up
    cursor.close()
    conn.close()

except Exception as e:
    print("Error:", e)
