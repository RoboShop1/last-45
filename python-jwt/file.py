import os


try:
    os.path.exists("/tmp/example.txt1")
except e:
    print("File is not exists {e}")