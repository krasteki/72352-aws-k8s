

provider "kubernetes" {
  host                   = var.cluster_endpoint
  cluster_ca_certificate = base64decode(var.cluster_ca_cert)
  exec {
    api_version = "client.authentication.k8s.io/v1alpha1"
    args        = ["eks", "get-token", "--cluster-name", var.cluster_name]
    command     = "aws"
  }
}

/*

provider "kubernetes" {
host = data.aws_eks_cluster.cluster.endpoint
cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
exec {
api_version = "client.authentication.k8s.io/user"
args = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.cluster.name]
command = "aws"
}
}

*/