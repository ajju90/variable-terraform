## Connect AWS to terraform 

provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

##....................................................................................##

##Create iam user and group add user in group

  resource "aws_iam_user" "user" {
  name = "ajay"
  }

resource "aws_iam_group_membership" "team" {
  name = "group"

  users = [
    aws_iam_user.user.name,
    
  ]

  group = aws_iam_group.group.name
}


##.....................................................................................##

## Create policy Administrator_Access

resource "aws_iam_policy" "policy" {
  name        = "Administrator_Access"
  description = "Administrator Access"
  policy = jsonencode({   

    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
      ]
})
}

##.......................................................................................##

##Create s3 bucket by using terraform

provider "aws" {
  region = "us-east-1" 
}
resource "aws_s3_bucket" "my_bucket" {
  bucket = "realme358"  
  tags = {
    Name = "S3-terraform-bucket"
  }

}