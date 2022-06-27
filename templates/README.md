# Provisioning instructions

## After "zero apply"

### Update k8s configmap/aws-auth

```sh
kubectl edit -n kube-system configmap/aws-auth
```

```yaml
mapRoles: |
  - rolearn: arn:aws:iam::<% index .Params `accountId` %>:user/<% .Name %>-ci
    username: <% .Name %>-ci
    groups:
    - system:masters
```

### Set github secrets AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY

- Access the IAM dashboard on the AWS console;
- Users > <% .Name %>-ci > Security credentials;
- Create access key;
- Set AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY in the github repo settings.