import jwt
import datetime

# Secret key (keep this safe!)
SECRET_KEY = "chaitu"


payload = {
    "user_id": 123,
    "role": "admin1"
}

token = jwt.encode(payload, SECRET_KEY, algorithm="HS256")


print(token)

print("=======")

SECRET_KEY = "chaitu1"

decoded_payload = jwt.decode(token, SECRET_KEY, algorithms=["HS256"])

print(decoded_payload)
