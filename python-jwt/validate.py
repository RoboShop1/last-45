import jwt


SECRET_KEY = "chaitu"

decoded_payload = jwt.decode(, SECRET_KEY, algorithms=["HS256"])

print(decoded_payload)