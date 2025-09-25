import socket
import time
import sys

host = "db"
port = 5432
timeout = 30

start_time = time.time()
while time.time() - start_time < timeout:
    try:
        with socket.create_connection((host, port), timeout=1):
            print("Database is ready!")
            sys.exit(0)
    except (socket.timeout, socket.gaierror, ConnectionRefusedError):
        print("Waiting for database...")
        time.sleep(1)
print("Timed out waiting for database")
sys.exit(1)
