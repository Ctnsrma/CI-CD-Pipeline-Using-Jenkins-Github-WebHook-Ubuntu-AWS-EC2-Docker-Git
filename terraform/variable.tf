variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "eu-north-1"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "m7i-flex.large"
}

variable "ami_id" {
  description = "Ubuntu AMI ID"
  type        = string
  default     = "ami-05d62b9bc5a6ca605"
}

variable "key_name" {
  description = "AWS Key Pair Name"
  type        = string
  default     = "cicd"
}