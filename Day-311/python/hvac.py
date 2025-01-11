import hvac

client = hvac.Client(
    url="https://3.83.178.62:8200/",  # Use the Vault server address
    token="s.yourVaultTokenHere",
    verify=False  # Disable TLS verification
)

if client.is_authenticated():
    print("Authenticated successfully!")
else:
    print("Authentication failed.")
    exit(1)