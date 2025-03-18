import jwt
import json
import base64


payload = {
    "user_id": 123,
    "role": "admin1"
}

with open("./good", "r") as key_file:
    private_key = key_file.read()

token = jwt.encode(payload, private_key, algorithm="RS256")..decode("utf-8")