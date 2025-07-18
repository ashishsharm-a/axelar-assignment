# Axelar Node Kubernetes Deployment

## Install

```
cd helm/
helm install axelar-node ./
```

## Metrics

- Prometheus metrics are exposed on port `26660`
- To scrape them, connect Prometheus to `axelar-node:26660/metrics`

## Volumes

- Chain data is stored in `/axelar/data` using a PersistentVolumeClaim (`500Gi`)

## Further Add-ons:

1. Add pre-sync job to validate genesis.json checksum

2. Add a Job or CronJob to periodically backup data/ to object storage

3. Add PodAntiAffinity to ensure validator pods are not co-located (if using multiple)

4. ArgoCD for hassle free deployment on k8s cluster

5. Implement RBAC strictly scoped to namespace axelar

6. Store sensitive keys like priv_validator_key.json in sealed secrets or HashiCorp Vault.
