import os


try:
    print(os.path.exists("/tmp/example.txt1"))
except e:
    print("File is not exists")