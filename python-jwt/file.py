with open('/tmp/example.txt', 'r') as file:
    line1 = file.readline()
    print(line1.strip())  # Reads the first line

    line2 = file.readline()
    print(line2.strip())