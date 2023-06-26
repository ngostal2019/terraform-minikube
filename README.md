# Integrate Terraform with your Local Minikube Cluster

## Pre-requisites:
   - A minikube Binary installed (Terraform will install the cluster)
   - Terraform Binary Installed
   - Maybe your custom manifest files

1. This code base structure has a [main.tf](./main.tf) file which has all the necessary entries to start a local Minikube cluster on your machine with some resources.
1. In the [providers.tf](./providers.tf) file we do have:
   - The `minikube` provider which will be useful to call the provider set to the desired K8S version we will create the minikube cluster. More info [here](https://registry.terraform.io/providers/scott-the-programmer/minikube/latest/docs/resources/cluster)
   - The `Kubernetes` provider used to securely connect to our cluster and start creating our resources like *deployment*, *service*, and *ingress* in the cluster. More info [here](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs)
1. The [version.tf](./versions.tf) is where we define the acceptable:
   - terraform required version
   - minikube required version
   - kubernetes required version
1. In the [variables.tf](./variables.tf), we are simply passing the variables we would like to pass to the other files
1. End result should look like the belows:

![Alt text](./Screenshot%202023-06-26%20001441.png)

![Alt text](./Screenshot%202023-06-26%20002409.png)

![Alt text](./Screenshot%202023-06-26%20002819.png)