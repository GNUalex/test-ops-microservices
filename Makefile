.DEFAULT_GOAL := help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

nfs-start: ## Start nfs server
	docker-compose -f ./nfs/docker-compose.yaml up -d

minikube-start: ## Start minikube
	minikube start --addons ingress

deploy-builder: ## Deploy builder components
	kubectl apply -f ./builder/k8s/namespace.yaml
	kubectl apply -f ./builder/k8s/secret.yaml
	kubectl apply -f ./builder/k8s/pv.yaml
	kubectl apply -f ./builder/k8s/pvc.yaml
	kubectl apply -f ./builder/k8s/deployment.yaml
	kubectl apply -f ./builder/k8s/service.yaml
	kubectl apply -f ./builder/k8s/ingress.yaml

deploy-api-builder: ## Deploy api-builder components
	kubectl apply -f ./api-builder/k8s/secret.yaml
	kubectl apply -f ./api-builder/k8s/deployment.yaml
	kubectl apply -f ./api-builder/k8s/service.yaml
	kubectl apply -f ./api-builder/k8s/ingress.yaml

destroy: ## Destroy the environment
	minikube delete
	docker-compose -f ./nfs/docker-compose.yaml down
