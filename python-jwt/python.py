import jwt


SECRET_KEY = "chaitu"


payload = {
    "user_id": 123,
    "role": "admin2"
}

payload_json = json.dumps(payload, separators=(",", ":"))
encoded_payload = base64.urlsafe_b64encode(payload_json.encode()).decode().rstrip("=")
print("Encoded Payload:", encoded_payload)

print("=" *10)

token_actual = jwt.encode(payload, SECRET_KEY, algorithm="HS256")

print(token_actual)




decoded_payload = jwt.decode(token_actual, SECRET_KEY, algorithms=["HS256"])


print(decoded_payload)




