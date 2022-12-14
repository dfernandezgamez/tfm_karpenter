variable "aws_region" {
  description = "La region de AWS donde desplegaremos la infraestructura"
  default     = "eu-central-1"
}

variable "availability_zones" {
  description = "Zonas de disponibilidad"
  type    = list(string)
  default = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
}

variable "cluster_name" {
  description = "El nombre del clúster"
  type        = string
  default     = "eks-tfm"
}
