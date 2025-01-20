variable "env" {
    description = "This is the enviromnt name eg. dev/stg/prod"
    type = string
}

variable "instance_type" {
    description = "This is the instance type for AWS EC2 eg. t2.micro/t2.small/t2.medium"
    type = string
}

variable "instance_count" {
    description = "This is the count of the no. of instances I need"
    type = number
}

variable "ec2_ami" {
    description = "This is the AMI ID for EC2 instance"
     type = string
}
variable "volume_size" {
    description = "This is the size of Root EBS for AWS EC2"
    type = number
}
