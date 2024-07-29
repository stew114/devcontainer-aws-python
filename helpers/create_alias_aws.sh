alias aws='docker run --rm -it -v ~/.aws:/root/.aws public.ecr.aws/aws-cli/aws-cli:latest'
alias aws='docker run --rm -it -v ~/.aws:/root/.aws -v /home/ubuntu/projects:/workspaces public.ecr.aws/aws-cli/aws-cli:latest'

# Run the following command (make sure to replace my-stack-name and my-key-pair with your desired stack name and your actual key pair name):
aws cloudformation create-stack --stack-name ec2-test-webserver --template-body src/cloudformation/ec2-test-webserver.yaml
aws cloudformation create-stack --stack-name ec2-test-webserver --template-body src/cloudformation/ec2-test-webserver.yaml --parameters ParameterKey=KeyName,ParameterValue=ec2-from-oracle-cloud

# Assuming the stack name used during creation was my-webserver-stack, you would delete it as follows:
aws cloudformation delete-stack --stack-name my-webserver-stack

# To verify that the stack and its resources have been deleted, you can use the following command to list all stacks and check their statuses:
aws cloudformation list-stacks --stack-status-filter CREATE_COMPLETE UPDATE_COMPLETE

#Run the following command, replacing my-key-pair with your desired key pair name:
aws ec2 create-key-pair --key-name ec2-from-oracle-cloud --query "KeyMaterial" --output text > ~/.aws/my-key-pair.pem

# After creating your stack, you can connect to your EC2 instance using the private key file:
ssh -i ec2-from-oracle-cloud.pem ec2-user@ # <your ip address>

# improved cloudformation template
aws cloudformation create-stack --stack-name ec2-test-webserverk --template-body src/cloudformation/ec2-test-webserver.yaml

# validate template
aws cloudformation validate-template --template-body file:///workspaces/devcontainer-aws/src/cloudformation/ec2-test-webserver.yaml