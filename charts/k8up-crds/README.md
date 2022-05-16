# k8up CRDs

Custom resource definitions for k8up - A Kubernetes and OpenShift Backup Operator based on restic

## Upgrade

```sh
export APP_VERSION=v2.1.2
wget -O templates/crds.yaml https://github.com/k8up-io/k8up/releases/download/$APP_VERSION/k8up-crd.yaml
```

Don't forget to also update `appVersion` and `version` in the Chart.yaml file.
The chart version must match with the [k8up Helm chart](https://artifacthub.io/packages/helm/appuio/k8up) version.
