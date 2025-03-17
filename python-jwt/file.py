file_list=["one\n","two\n","threeee\n"]
with open('/tmp/example.txt', 'w') as file:
    file.writelines(file_list)
