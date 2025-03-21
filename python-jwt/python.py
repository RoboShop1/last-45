import jwt
import json
import base64

SECRET_KEY = "chaitu"


payload = {
    "user_id": 123,
    "role": "admin1"
}

payload_json = json.dumps(payload, separators=(",", ":"))
encoded_payload = base64.urlsafe_b64encode(payload_json.encode()).decode().rstrip("=")
print("Encoded Payload:", encoded_payload)

token_actual = jwt.encode(payload, SECRET_KEY, algorithm="HS256").decode("utf-8")
print(token_actual)
decoded_payload = jwt.decode(token_actual, SECRET_KEY, algorithms=["HS256"])
print(decoded_payload)

'''
// separate //
'''
print("=" *10)
payload1 = {
    "user_id": 123,
    "role": "admin4"
}
payload_json = json.dumps(payload1, separators=(",", ":"))
encoded_payload = base64.urlsafe_b64encode(payload_json.encode()).decode().rstrip("=")
print("Encoded Payload:", encoded_payload)
print("=" *10)






