#value = mein module(dev-infra) ka ec2 ka public & private ips
output "dev_infra_ec2_public_ips" {
    value = module.dev-infra.ec2_public_ips
}
output "stg_infra_ec2_public_ips" {
    value = module.stg-infra.ec2_public_ips
}
output "prod_infra_ec2_public_ips" {
    value = module.prod-infra.ec2_public_ips
}
output "prod_infra_ec2-ami_id" {
    value = module.dev-infra.ec2_ami_id
}