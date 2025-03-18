''''
ssh-keygen -t rsa -b 4096 -m PEM -f jwt_rsa_key


## ssh-keygen creates public keys in OpenSSH format by default, but PyJWT expects the PEM format.

ssh-keygen -e -m PEM -f jwt_rsa_key.pub > jwt_rsa_key_pub.pem

'''

import jwt
import json
import base64


payload = {
    "user_id": 123,
    "role": "admin1"
}

with open("/root/good", "r") as key_file:
    private_key = key_file.read()

token = jwt.encode(payload, private_key, algorithm="RS256").decode("utf-8")

print(token)


print("#" *10)

with open("/root/good.pub", "r") as key_file:
    public_key = key_file.read()

# Decode the JWT (verify with public key)
decoded = jwt.decode(token, public_key, algorithms=["RS256"])
print("Decoded JWT:", decoded)