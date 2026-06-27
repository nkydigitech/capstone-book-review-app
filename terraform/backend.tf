# Remote State Backend - S3 + DynamoDB
#
# IMPORTANT: Create these AWS resources BEFORE uncommenting:
#
# Step 1 - Create S3 bucket (run in terminal):
#   aws s3api create-bucket --bucket capstone-tfstate-YOURACCOUNTID --region us-east-1
#   aws s3api put-bucket-versioning \
#     --bucket capstone-tfstate-YOURACCOUNTID \
#     --versioning-configuration Status=Enabled
#
# Step 2 - Create DynamoDB lock table:
#   aws dynamodb create-table \
#     --table-name capstone-tfstate-lock \
#     --attribute-definitions AttributeName=LockID,AttributeType=S \
#     --key-schema AttributeName=LockID,KeyType=HASH \
#     --billing-mode PAY_PER_REQUEST --region us-east-1
#
# Step 3 - Replace YOURACCOUNTID below and uncomment:

# terraform {
#   backend "s3" {
#     bucket         = "capstone-tfstate-YOURACCOUNTID"
#     key            = "capstone/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "capstone-tfstate-lock"
#     encrypt        = true
#   }
# }
