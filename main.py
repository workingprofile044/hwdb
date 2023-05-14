import psycopg2

def create_db(conn):
    with conn.cursor() as cur:
        cur.execute("""
            CREATE TABLE IF NOT EXISTS clients (
                id SERIAL PRIMARY KEY,
                first_name TEXT NOT NULL,
                last_name TEXT NOT NULL,
                email TEXT NOT NULL,
                phones TEXT[]
            );
        """)

def add_client(conn, first_name, last_name, email, phones=None):
    with conn.cursor() as cur:
        cur.execute("""
            INSERT INTO clients (first_name, last_name, email, phones)
            VALUES (%s, %s, %s, %s)
            RETURNING id;
        """, (first_name, last_name, email, phones))
        client_id = cur.fetchone()[0]
    return client_id

def add_phone(conn, client_id, phone):
    with conn.cursor() as cur:
        cur.execute("""
            UPDATE clients
            SET phones = array_append(phones, %s)
            WHERE id = %s;
        """, (phone, client_id))

def change_client(conn, client_id, first_name=None, last_name=None, email=None, phones=None):
    with conn.cursor() as cur:
        cur.execute("""
            UPDATE clients
            SET first_name = COALESCE(%s, first_name),
                last_name = COALESCE(%s, last_name),
                email = COALESCE(%s, email),
                phones = COALESCE(%s, phones)
            WHERE id = %s;
        """, (first_name, last_name, email, phones, client_id))

def delete_phone(conn, client_id, phone):
    with conn.cursor() as cur:
        cur.execute("""
            UPDATE clients
            SET phones = array_remove(phones, %s)
            WHERE id = %s;
        """, (phone, client_id))

def delete_client(conn, client_id):
    with conn.cursor() as cur:
        cur.execute("""
            DELETE FROM clients
            WHERE id = %s;
        """, (client_id,))

def find_client(conn, first_name=None, last_name=None, email=None, phone=None):
    query = """
        SELECT id, first_name, last_name, email, phones
        FROM clients
        WHERE 1 = 1
    """
    params = []
    if first_name:
        query += "AND first_name = %s "
        params.append(first_name)
    if last_name:
        query += "AND last_name = %s "
        params.append(last_name)
    if email:
        query += "AND email = %s "
        params.append(email)
    if phone:
        query += "AND phones @> ARRAY[%s] "
        params.append(phone)
    with conn.cursor() as cur:
        cur.execute(query, params)
        return cur.fetchall()

with psycopg2.connect(database="netology_db", user="postgres", password="postgres") as conn:
    create_db(conn)

    client_id = add_client(conn, "John", "Doe", "johndoe@example.com", ["555-1234", "555-5678"])
    print("Added client with ID:", client_id)

    add_phone(conn, client_id, "555-9101")
    print("Added phone number")

    change_client(conn, client_id, email="john.doe@example.com")
    print("Changed client email")

    doe_clients = find_client(conn, last_name="Doe")
    print("Found", len(doe_clients), "clients with surname Doe")

    delete_phone(conn, client_id, "555-5678")
    print("Deleted phone number for client")

    delete_client(conn, client_id)
    print("Deleted client and information")

conn.close()
