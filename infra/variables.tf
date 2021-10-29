variable "tags" {
  default = {
    Ambiente      = "Homologação"
    Projeto       = "OpenBanking"
    Squad         = "Papito"
    GerenciadoPor = "Terraform"
  }
}

variable "aws_region" {
  default = "us-east-2"
}


#data "aws_secretsmanager_secret_version" "postgress_creds" {
#  secret_id = "rds/password"
#}

#locals {
#  db_creds = jsondecode(data.aws_secretsmanager_secret_version.postgress_creds.secret_string)
#}

variable "map_users" {
  description = "Additional IAM users to add to the aws-auth configmap."
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))

  default = [
    {
      userarn  = "arn:aws:iam::740056045412:user/admin"
      username = "admin"
      groups   = ["system:masters"]
    }
  ]
}

#use on codebuild
#variable "map_roles" {
#  description = "Additional IAM roles to add to the aws-auth configmap."
#  type = list(object({
#    rolearn  = string
#    username = string
#    groups   = list(string)
#  }))

#  default = [
#    {
#      rolearn  = "arn:aws:iam::967201331463:role/tf-codebuild-role" 
#      username = "codebuild.role"
#      groups   = ["system:masters"]
#    },
#  ]
#}


