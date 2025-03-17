with open('/tmp/example.txt', 'r') as file:
    line1 = file.readline()
    print(line1)  # Reads the first line

    line2 = file.readline()
    print(line2)