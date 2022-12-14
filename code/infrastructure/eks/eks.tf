#Modulo de EKS
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "<18"
  cluster_version = "1.24"
  cluster_name    = var.cluster_name
  vpc_id          = module.vpc.vpc_id
  subnets         = module.vpc.private_subnets
  enable_irsa     = true
  # Solo necesitamos 1 nodo para instalar Karpenter
  worker_groups = [
    {
      instance_type = "t3a.medium"
      asg_max_size  = 1
    }
  ]
  tags = {
    "karpenter.sh/discovery" = var.cluster_name
  }
}
