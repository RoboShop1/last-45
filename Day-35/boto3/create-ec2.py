import boto3
import time


ec2_client = boto3.client(service_name="ec2",region_name="us-east-1")


response = ec2_client.run_instances(
    ImageId='ami-01816d07b1128cd2d',
    InstanceType='t2.micro',
    MaxCount=2,
    MinCount=2,

    TagSpecifications=[{
        'ResourceType': 'instance',
        'Tags': [{
            'Key': 'Name',
            'Value': 'boto3'
        }]
    }]
    )

state = ""
while True:
    for i in response["Instances"]:
        print("weather for is executed")
        if i["State"]["Name"] == "running":
           state = "running"
           print("Yes this condition state is executed")
           break
        print("Sleep is executed")
        time.sleep(5)
        if state == "running":
           for i in response["Instances"]:
               print(f"Instance-Id = {i['InstanceId']}")
               print(f"Instance-Public = {i['PublicDnsName']}")
               print("============================")
        break





