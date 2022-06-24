SHELL = /usr/bin/env bash
PROJECT = <% .Name %>
export AWS_DEFAULT_REGION = <% index .Params `region` %>
export AWS_PAGER =
KUBE_CONTEXT := $(PROJECT)

.EXPORT_ALL_VARIABLES:

apply: terraform-apply update-k8s-conf

terraform-apply:
	# Import the aws-auth configmap into the state if it doesn't yet exist. EKS creates this automatically
	cd terraform && \
	terraform init && \
	(terraform state show module.kubernetes.kubernetes_config_map.aws_auth > /dev/null || (terraform plan && terraform refresh && terraform import module.kubernetes.kubernetes_config_map.aws_auth kube-system/aws-auth)) && \
	terraform apply -auto-approve

update-k8s-conf:
	aws eks --region $(AWS_DEFAULT_REGION) update-kubeconfig --name $(KUBE_CONTEXT) --alias $(KUBE_CONTEXT)

terraform-destroy:
	cd terraform && \
	terraform refresh && \
	terraform destroy

.PHONY: apply terraform-apply update-k8s-conf
