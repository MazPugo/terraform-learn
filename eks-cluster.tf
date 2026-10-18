module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.29.0"

  # Core EKS v21 settings
  name               = "myapp-eks-cluster"
  kubernetes_version = "1.37"

  vpc_id                 = module.myapp-vpc.vpc_id
  subnet_ids             = module.myapp-vpc.private_subnets
  endpoint_public_access = true

  # Enable cluster creator admin permissions
  enable_cluster_creator_admin_permissions = true

  # Disable Auto Mode compute to route to your manual node groups instead
  compute_config = {
    enabled = false
  }

  # RENAMED FOR v21: cluster_addons is now addons
  addons = {
    coredns                = {}
    eks-pod-identity-agent = { before_compute = true }
    kube-proxy             = {}
    vpc-cni                = { before_compute = true }
  }

  eks_managed_node_groups = {
    dev = {
      instance_types = ["t2.small"]
      ami_type       = "AL2023_x86_64_STANDARD"
      min_size       = 1
      max_size       = 3
      desired_size   = 3
    }
  }

  tags = {
    environment = "development"
    application = "myapp"
  }
}
