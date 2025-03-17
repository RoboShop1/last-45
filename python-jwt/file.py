import csv

with open("/tmp/1.csv","r") as file:
        reader = csv.reader(file)  # Create a CSV reader object

        # Iterate through each row and print
        for row in reader:
             print(", ".join(row))