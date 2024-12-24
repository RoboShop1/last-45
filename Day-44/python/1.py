import sys


def name(one):
    print(f"Name is {one}")


try:
    name(12)
    status = True
except:
    print("except block is executed")
    status = False
if not status:
    print("we get the error")




