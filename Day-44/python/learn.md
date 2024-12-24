## In functions position parameters are IMP

## Be sure with positional arguments & key-word arguments..

!! positional arguments follow by key word arguments.

```
import sys

print(sys.exc_info()[0])

os._exit(0) vs finally block..
```


```

The requests library in Python provides a flexible API that supports a variety of arguments for HTTP methods such as requests.get, requests.post, etc. The number of arguments you can pass is determined by the specific method you're using. Here's a breakdown of commonly used arguments:

Key Arguments in Requests
1. url (Required)
The URL to which the request is sent.
Example:
python
Copy code
url = "https://api.example.com/data"
2. params (Optional)
Dictionary, list of tuples, or bytes sent as query parameters in the URL.
Example:
python
Copy code
params = {"key1": "value1", "key2": "value2"}
response = requests.get(url, params=params)
3. headers (Optional)
Dictionary of HTTP headers to send with the request.
Example:
python
Copy code
headers = {"Authorization": "Bearer token"}
response = requests.get(url, headers=headers)
4. data (Optional)
Dictionary, list of tuples, or bytes to send in the body of the request (commonly used for POST or PUT).
Example:
python
Copy code
data = {"key1": "value1"}
response = requests.post(url, data=data)
5. json (Optional)
A JSON serializable Python object to send in the body of the request.
Example:
python
Copy code
payload = {"key1": "value1"}
response = requests.post(url, json=payload)
6. auth (Optional)
A tuple for HTTP Basic Authentication.
Example:
python
Copy code
from requests.auth import HTTPBasicAuth
response = requests.get(url, auth=HTTPBasicAuth('user', 'pass'))
7. cookies (Optional)
Dictionary of cookies to send with the request.
Example:
python
Copy code
cookies = {"session_id": "abcd1234"}
response = requests.get(url, cookies=cookies)
8. timeout (Optional)
Timeout for the request in seconds (can be a float or tuple).
Example:
python
Copy code
response = requests.get(url, timeout=5)  # Timeout after 5 seconds
9. allow_redirects (Optional)
Boolean to enable/disable redirection handling (default is True).
Example:
python
Copy code
response = requests.get(url, allow_redirects=False)
10. proxies (Optional)
Dictionary of proxy servers to use for the request.
Example:
python
Copy code
proxies = {"http": "http://10.10.1.10:3128"}
response = requests.get(url, proxies=proxies)
11. stream (Optional)
Boolean indicating whether to stream the response (default is False).
Example:
python
Copy code
response = requests.get(url, stream=True)
12. verify (Optional)
Boolean or path to a CA bundle file for SSL certificate verification (default is True).
Example:
python
Copy code
response = requests.get(url, verify=False)  # Disable SSL verification
13. cert (Optional)
Path to client-side SSL certificate file (can be a single file or a tuple of key and certificate files).
Example:
python
Copy code
response = requests.get(url, cert=('/path/client.cert', '/path/client.key'))
```