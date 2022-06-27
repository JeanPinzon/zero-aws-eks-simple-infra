SHELL = /usr/bin/env bash
PROJECT = <% .Name %>
export AWS_DEFAULT_REGION = <% index .Params `region` %>
export AWS_PAGER =
KUBE_CONTEXT := $(PROJECT)-eks-cluster

.EXPORT_ALL_VARIABLES:

apply: terraform-apply update-k8s-conf after-apply-inscructions

terraform-apply:
	cd terraform && \
	terraform init && \
	terraform apply -auto-approve

update-k8s-conf:
	aws eks --region $(AWS_DEFAULT_REGION) update-kubeconfig --name $(KUBE_CONTEXT) --alias $(KUBE_CONTEXT)

after-apply-inscructions:
	@echo 'please read the section "After zero apply" on the infraestructure project README.md to finish the setup'

terraform-destroy:
	cd terraform && \
	terraform refresh && \
	terraform destroy

.PHONY: apply terraform-apply update-k8s-conf
