import csv

with open("/tmp/1.csv","r") as file:
    print(csv.reader(file))