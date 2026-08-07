# edgecontainertester

A simple Python "Hello World" web app that builds as a Docker container and is deployed via an **Azure Arc + K3s + Flux GitOps** workflow.

## How it works

1. A developer pushes a commit to `main`.
2. The GitHub Actions workflow (`.github/workflows/build-push.yml`) builds the Docker image and pushes it to an **Azure Container Registry (ACR)** tagged with the commit SHA.
3. The workflow commits the updated image tag back to `k8s/deployment.yaml`.
4. **Flux** detects the change in `k8s/` and applies the updated manifest to the **K3s** cluster, rolling out the new container automatically.

## Local development

```bash
pip install -r requirements.txt
python app.py          # visit http://localhost:8080
```

## Docker

```bash
docker build -t edgecontainertester .
docker run -p 8080:8080 edgecontainertester
```

## Required GitHub Secrets

| Secret          | Description                          |
|-----------------|--------------------------------------|
| `ACR_REGISTRY`  | ACR login server (e.g. `myacr.azurecr.io`) |
| `ACR_USERNAME`  | ACR admin username                   |
| `ACR_PASSWORD`  | ACR admin password                   |