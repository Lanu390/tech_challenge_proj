# Create EKS Cluster
resource "aws_eks_cluster" "duddala" {
  name     = "duddala"
  role_arn = aws_iam_role.eks_role.arn
  version  = "1.27"
  tags = {
    OWNER     = "DUDDALA_L"
    CATEGORY  = "ENG_ASSESSMENT"
  }
  vpc_config {
    security_group_ids = [aws_security_group.tech_challenge_sg.id]
    subnet_ids = module.vpc.private_subnets

  }
}

# Create IAM role for EKS Cluster
resource "aws_iam_role" "eks_role" {
  name = "eks-cluster-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = {
        Service = "eks.amazonaws.com"
      },
      Action    = "sts:AssumeRole"
    }]
  })
}

# Attach policy to EKS role
resource "aws_iam_policy_attachment" "eks_policy_attachment" {
  name       = "AmazonEKSClusterPolicy"
  roles      = [aws_iam_role.eks_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

# Create Node Group
resource "aws_eks_node_group" "duddala_node_group" {
  cluster_name    = aws_eks_cluster.duddala.name
  node_group_name = "duddala-node-group"
  node_role_arn   = aws_iam_role.node_role.arn
  subnet_ids = module.vpc.private_subnets
  scaling_config {
    min_size = 3
    max_size = 6
    desired_size = 4
  }
  tags = {
    OWNER     = "DUDDALA_L"
    CATEGORY  = "ENG_ASSESSMENT"
  }
  instance_types = ["c5.large"]
  ami_type = "AL2_x86_64"

  update_config {
    max_unavailable = 1
  }

}

# Create IAM role for nodes
resource "aws_iam_role" "node_role" {
  name = "eks-node-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      },
      Action    = "sts:AssumeRole"
    }]
  })
}

# Attach policy to node role
resource "aws_iam_policy_attachment" "node_policy_attachment" {
  name       = "AmazonEKSWorkerNodePolicy"
  roles      = [aws_iam_role.node_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}


# Attach AmazonEKS_CNI_Policy to node role
resource "aws_iam_policy_attachment" "eks_cni_policy_attachment" {
  name       = "AmazonEKS_CNI_Policy_attachment"
  roles      = [aws_iam_role.node_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

# Attach AmazonEC2ContainerRegistryReadOnly to node role
resource "aws_iam_policy_attachment" "ecr_readonly_policy_attachment" {
  name       = "AmazonEC2ContainerRegistryReadOnly_attachment"
  roles      = [aws_iam_role.node_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}


