~/_Lecture_prom_learning.kit/ch7/7.4/install-istio.sh
istioctl install --set profile=demo -y

kubectl create namespace bookinfo

kubectl get svc istio-ingressgateway -n istio-system

kubectl label namespace bookinfo istio-injection=enabled 
kubectl apply -f ~/_Lecture_prom_learning.kit/ch7/7.4/samples/bookinfo
kubectl apply -f ~/_Lecture_prom_learning.kit/ch7/7.4/samples/addon

kubectl apply ~/_Lecture_prom_learning.kit/ch7/7.4/blackbox-exporter.yaml
kubectl apply ~/_Lecture_prom_learning.kit/ch7/7.4/blackbox-exporter-service.yaml

kubectl patch configmap -n monitoring prometheus-server --patch-file bookinfo-probe-monitoring.yaml

kubectl scale -n bookinfo deployment details --replicas=0
kubectl scale -n bookinfo deployment details --replicas=1

kubectl delete -f ~/_Lecture_prom_learning.kit/ch7/7.4/samples/bookinfo
kubectl delete -f ~/_Lecture_prom_learning.kit/ch7/7.4/samples/addon