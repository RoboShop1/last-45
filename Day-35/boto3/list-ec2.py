import boto3

ec2_client = boto3.client(service_name="ec2",region_name="us-east-1")

response = ec2_client.describe_instances()

print(response["Reservations"])


for i in response["Reservations"]:
    for j in i["Instances"]:
        print(f"InstanceID = {j["InstanceId"]}")
        print("==========")





