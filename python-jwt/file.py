import json

try:
    with open("1.json","r") as file:
        data = json.load(file)
except Exception as msg:
    print(type(msg))

else:
    print(data)



