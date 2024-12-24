import boto3


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


print(response)




