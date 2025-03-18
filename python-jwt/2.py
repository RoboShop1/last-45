try:
    print(10/0)
except Exception as msg:
    print(f"{msg.__class__.__name__}")