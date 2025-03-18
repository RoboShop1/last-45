import json
import base64

# Payload
payload = {
    "user_id": 123,
    "role": "admin2"
}

# Convert to JSON string
payload_json = json.dumps(payload, separators=(",", ":"))

print(payload_json)

# Encode to Base64 URL-safe format (without padding)
encoded_payload = base64.urlsafe_b64encode(payload_json.encode()).decode().rstrip("=")

print("Encoded Payload:", encoded_payload)