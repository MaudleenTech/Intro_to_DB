import mysql.connector
from mysql.connector import errorcode

def create_database():
    # Database connection configuration
    db_config = {
        'host': 'localhost',
        'user': 'root',
        'password': 'Ajiri19?',
    }
    DB_NAME = 'alx_book_store'
    
    cnx = None
    try:
        # Connect to the MySQL server
        cnx = mysql.connector.connect(**db_config)
        cursor = cnx.cursor()

        # Execute the SQL command
        database_creation_query = f"CREATE DATABASE IF NOT EXISTS alx_book_store"
        
        cursor.execute(database_creation_query)
        
        print("Database 'alx_book_store' created successfully!")

    except mysql.connector.Error as err:
        # Handle connection errors
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Error: Failed to connect to DB. Something is wrong with your username or password.")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print(f"Error: Database does not exist.")
        else:
            print(f"Error: Failed to connect to DB. {err}")
    finally:
        # Handle close of the DB connection
        if cnx and cnx.is_connected():
            cursor.close()
            cnx.close()

if __name__ == "__main__":
    create_database()