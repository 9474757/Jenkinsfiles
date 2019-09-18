mkdir DASH_BOARD_CERTS
openssl req -nodes -newkey rsa:2048 -keyout ./dashboard.key -out ./dashboard.csr -subj "/C=/ST=/L=/O=/OU=/CN=kubernetes-dashboard"
openssl x509 -req -sha256 -days 365 -in ./dashboard.csr -signkey ./dashboard.key -out ./dashboard.crt

### Generate the kubernetes-dashboard-certs certificate file
kubectl create secret generic kubernetes-dashboard-certs --from-file=DASH_BOARD_CERTS -n kube-system

### Make sure the kubernetes- dashboards -certs secret has been imported correctly
kubectl -n kube-system describe secret/kubernetes-dashboard-certs
