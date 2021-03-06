minikube start
eval $(minikube docker-env)
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
#build docker files
docker build -t ftps ./srcs/FTPS 
docker build -t nginx ./srcs/nginx
docker build -t phpmyadmin ./srcs/phpmyadmin
docker build -t wordpress ./srcs/wordpress
docker build -t mysql ./srcs/mysql

kubectl apply -f ./srcs/kubernetes/metallb.yaml 
kubectl apply -f ./srcs/kubernetes/ftps_conf.yaml
kubectl apply -f ./srcs/kubernetes/nginx_conf.yaml
kubectl apply -f ./srcs/kubernetes/phpmyadmin_conf.yaml
kubectl apply -f ./srcs/kubernetes/wordpress_conf.yaml
kubectl apply -f ./srcs/kubernetes/mysql_conf.yaml