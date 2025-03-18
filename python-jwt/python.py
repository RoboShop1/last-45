import jwt


SECRET_KEY = "chaitu"


payload = {
    "user_id": 123,
    "role": "admin1"
}
token_actual = jwt.encode(payload, SECRET_KEY, algorithm="HS256")

print(token_actual)

print(token_actual,+,"lll")


decoded_payload = jwt.decode(token_actual, SECRET_KEY, algorithms=["HS256"])


print(decoded_payload)




