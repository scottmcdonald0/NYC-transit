import duckdb

def main(conn):
    # get table names
    tables = conn.execute('SHOW TABLES').fetchall()

    # print the table name and row count
    for table in tables:
        table = table[0]
        print(table)
        row_count = conn.execute(f"SELECT COUNT(*) FROM {table}").fetchall()[0][0]
        print(row_count)

# call main and create connection
if __name__ == "__main__":
    with duckdb.connect('main.db') as conn:
        main(conn)

