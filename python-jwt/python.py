import jwt


SECRET_KEY = "chaitu"


payload = {
    "user_id": 123,
    "role": "admin1"
}
token_actual = jwt.encode(payload, SECRET_KEY, algorithm="HS256")

print(token_actual)


print("================")

payload = {
    "user_id": 123,
    "role": "admin2"
}
token_tempered = jwt.encode(payload, SECRET_KEY, algorithm="HS256")

print(token_tempered)

print("============")


token_tempered = jwt.encode(payload, SECRET_KEY, algorithm="HS256")

decoded_payload = jwt.decode(token_tempered, SECRET_KEY, algorithms=["HS256"])


