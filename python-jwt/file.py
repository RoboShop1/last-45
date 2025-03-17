import os


try:
    print(os.path.exists("/tmp/example.txt1"))
except:
    print("File is not exists")