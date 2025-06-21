# Ansible


### Run ansible for Redis
ansible-playbook redis.yaml -i PrivateIP, --user="ubuntu" --private-key=devops.pem -vv -b


### Run ansible for pritunl
ansible-playbook pretunl.yaml -i PublicIP, --user="ubuntu" --private-key=/devops.pem -vvv -b