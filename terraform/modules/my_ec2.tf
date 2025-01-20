
#key-pair
resource "aws_key_pair" "deployer" {
    key_name = "${var.env}-terra-key-p"
    public_key = file("tws-terra-key-p.pub")
}
#default-VPC
resource "aws_default_vpc" "default" {
    tags = {
        Name = "terra VPC"
  }
}
#security-group
resource "aws_security_group" "allow_user_to_connect" {
    name = "${var.env}-tws-app-sg"
    description = "allow user to connect via SG"
    vpc_id = aws_default_vpc.default.id
    
    ingress {
        description = "allow access to SSH port 22"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "allow access to http port 80"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        description = "allow all out going traffic"
        to_port = 0
        from_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "${var.env}-tws-app-sg"
    }
}

#aws_instance
resource aws_instance my_instance{
    count = var.instance_count       #meta argument aur replicas banata hai
    #for_each = local.instancep               #meta argument dono ek sath kam nahik ker skty count and for_each, instance for_each k sath create ho rehy hain
    instance_type = var.instance_type
    ami = var.ec2_ami
    key_name = aws_key_pair.deployer.key_name
    security_groups = [aws_security_group.allow_user_to_connect.name] 
    #storage 
    root_block_device {
        volume_size = var.volume_size
        volume_type = "gp3"
    }
    tags = {
        Name = "${var.env}-app-instance-${count.index + 1}"
        Environment = var.env
    }
}

