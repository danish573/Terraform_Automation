variable "bucket_prefix" {
  type = string
  description = "create unique bucket name beginning with specified prefix"
  default = "my-s3-bucket-"
}

variable "versioning" {
  type = bool
  description = "(Optional) State of versioning"
  default = true
}

/*variable "acl" {
  type = string
  description = "Default or private"
  default = "private"
}*/

variable "tags" {
  type = map
  description = "(optional) Mapping tag to assign a bucket"
  default = {
    environment = "Dev"
    terraform = "true"
  }
}

variable "aws_region" {
  description = "AWS region to create things"
  default = "ap-south-1"
}

variable "security_group" {
  description = "Name of security group"
  default = "jenkins-sgroup"
}

variable "ami_id" {
  description = "AMI for EC-2 Instance"
  default = "ami-084568db4383264d4"
}

variable "key_name" {
  description = "Key for launch Instance"
  default = "Linux1"
}

variable "instance_type" {
  description = "EC-2 Instance"
  default = "t2.micro"
}

variable "tag_name" {
  description = "Tag name for EC-2 Instance"
  default = "my-ec2-instance"
}
