#this is only tempalet ye output nahi dy gi balky isko main.tf mein module k sath combine ker k output sow kerwa rehy hain
output "ec2_public_ips" {
    value =aws_instance.my_instance[*].public_ip
    description = "Public IP adresses of AWS EC2 instances"
}

output "ec2_private_ip" {
    value = aws_instance.my_instance[*].private_ip[*]
    description = "Private IP adresses of AWS EC2 instances"
}
output "ec2_ami_id" {
    value = aws_instance.my_instance[*].ami
}