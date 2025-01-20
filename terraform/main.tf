#dev-infra
#2 ec2 1 s3 1 dynamo
module "dev-infra" {
    source = "./modules"
    env = "dev"
    instance_count = 2
    instance_type = "t2.micro"
    ec2_ami = "ami-07eef52105e8a2059"
    volume_size = 10
}
#stg-infra
#2 ec2 1 s3 1 dynamo
module "stg-infra" {
    source = "./modules"
    env = "stg"
    instance_count = 2
    instance_type = "t2.small"
    ec2_ami = "ami-07eef52105e8a2059"
    volume_size = 10
}
#prod-infra
#3 ec2 1 s3 1 dynamo
module "prod-infra" {
    source = "./modules"
    env = "prod"
    instance_count = 3
    instance_type = "t2.micro"
    ec2_ami = "ami-07eef52105e8a2059"
    volume_size = 10
}

