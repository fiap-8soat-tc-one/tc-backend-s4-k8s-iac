variable "Principal_Arn" {
  default = "arn:aws:iam::763375054615:role/voclabs"
}

variable "LabRole" {
  default = "arn:aws:iam::763375054615:role/LabRole"

}

variable "ProjectName" {
  default = "tc-backend-s3"
}

variable "subnet_id_1" {
  default = "subnet-0bbaf86f7683786f3"
}

variable "subnet_id_2" {
  default = "subnet-0d1c2cda11bd3ce61"
}
variable "access_config" {
  default = "API_AND_CONFIG_MAP"
}

variable "type_instaces" {
  default = "t3a.medium"
}

variable "policyArn" {
  default = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
}

variable "default_region" {
  default = "us-east-1"
}

variable "vpc_id" {
  default = "vpc-0c11621830eb2d617"
}