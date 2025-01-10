import requests

url = "https://3.83.178.62:8200/v1/roboshop-dev/data/frontend"

headers = {"X-Vault-Token": ""}

response = requests.get(url,headers=headers)

data = {
data = {
'app1': 'frontend1',
'app2': 'frontend2'
}
}

response = requests.post(url,headers=headers,json=data)
