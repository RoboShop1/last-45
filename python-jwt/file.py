import csv

with open("/tmp/1.csv","r") as file:
    for i in csv.reader(file):
        print(i)