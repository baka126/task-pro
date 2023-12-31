This Kubernetes Deployment YAML file (deployment.yaml) defines a deployment for the task-pro application with one replica. It pulls the Docker image from the specified GitLab Container Registry and uses a secret named my-registry-secret for authentication.

Replace BASE64_ENCODED_DOCKER_CONFIG_JSON with the Base64-encoded Docker configuration JSON containing your GitLab Container Registry credentials.

This GitLab CI/CD YAML file (.gitlab-ci.yml) defines a CI/CD pipeline for building and pushing Docker images to the GitLab Container Registry. It uses the specified Dockerfile and tags the images based on the branch.

This Dockerfile specifies the base image, sets environment variables, installs dependencies, sets up the Android SDK, and defines the default command to run.

This Helm chart values file (values.yaml) defines configuration parameters for your Helm chart, such as the number of replicas, Docker image details, service configuration, and image pull secrets.
