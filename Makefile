SHELL := /bin/bash

.EXPORT_ALL_VARIABLES:

run: make-apply

make-apply:
	cd $(PROJECT_DIR) && make apply

summary:
	@echo "zero-aws-eks-simple-infra:"
	@echo "- Repository URL: ${REPOSITORY}"
	@echo "- To see your kubernetes clusters, run: 'kubectl config get-contexts'"
	@echo "- To inspect the selected cluster, run 'kubectl get node,service,deployment,pods'"