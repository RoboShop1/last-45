import requests

# Define the API endpoint
url = "https://reqbin.com/echo/get/json"

# Make a GET request
response = requests.get(url)

print(response.json())

# Check if the request was successful
# if response.status_code == 200:
#     # Parse the JSON response
#     data = response.json()
#     print(data)
# else:
#     print(f"Failed to retrieve data: {response.status_code}")

