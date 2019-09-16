eksctl create cluster \
--name EKS-TEST-BY-MAN \
--version 1.14 \
--nodegroup-name standard-workers \
--node-type t2.micro \
--nodes 1 \
--nodes-min 2 \
--nodes-max 3 \
--ssh-access --ssh-public-key=mak.pub \
--node-ami auto
