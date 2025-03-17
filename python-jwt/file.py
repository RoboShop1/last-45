with open("/tmp/example.txt", "r") as file:
    for i in file.readlines():
        print(i)