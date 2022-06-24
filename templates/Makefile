SHELL = /usr/bin/env bash
PROJECT = <% .Name %>
export AWS_DEFAULT_REGION = <% index .Params `region` %>
export AWS_PAGER =
KUBE_CONTEXT := $(PROJECT)

.EXPORT_ALL_VARIABLES:

apply: terraform-apply update-k8s-conf

terraform-apply:
	cd terraform && \
	terraform init && \
	terraform apply -auto-approve

update-k8s-conf:
	aws eks --region $(AWS_DEFAULT_REGION) update-kubeconfig --name $(KUBE_CONTEXT) --alias $(KUBE_CONTEXT)

terraform-destroy:
	cd terraform && \
	terraform refresh && \
	terraform destroy

.PHONY: apply terraform-apply update-k8s-conf
