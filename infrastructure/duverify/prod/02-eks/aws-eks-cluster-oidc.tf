resource "aws_iam_openid_connect_provider" "eks_cluster" {
    depends_on = [
                module.eks,
               ]
  url = module.eks.oidc_provider_url

  client_id_list = [
    "sts.amazonaws.com",
  ]

  thumbprint_list = [data.tls_certificate.eks_cert.certificates.0.sha1_fingerprint]
}