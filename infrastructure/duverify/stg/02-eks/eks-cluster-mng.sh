MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="//"

--//
Content-Type: text/x-shellscript; charset="us-ascii"
#!/bin/bash
set -ex
B64_CLUSTER_CA=${B64_CLUSTER_CA}
API_SERVER_URL=${API_SERVER_URL}
K8S_CLUSTER_DNS_IP=172.20.0.10
/etc/eks/bootstrap.sh ${CLUSTER_NAME} --use-max-pods false --kubelet-extra-args '--node-labels=eks.amazonaws.com/nodegroup=${NODE_GROUP},eks.amazonaws.com/nodegroup-image=${AMI_ID} ${kubelet_extra_args}' --b64-cluster-ca $B64_CLUSTER_CA --apiserver-endpoint $API_SERVER_URL --dns-cluster-ip $K8S_CLUSTER_DNS_IP

--//--
