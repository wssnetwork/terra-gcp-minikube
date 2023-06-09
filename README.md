# terra-gcp-minikube


## Define project id
* Create environment variable TF_VAR_project="your-gcp-proj-id"
* Must run `terraform plan` to get it effective
* Need to reload vscode if it set while vscode is running

## Before Terraform (for local machine)
* Need to auth via gcloud
```
$ gcloud auth application-default login
```

## Terraform lifecycle (for local machine)
```
# for init all requirements
$ terraform init

# to validate the script
$ terraform validate

# to do plan
$ terraform plan
# OR with output plan file
$ terraform plan -out=<filename.tfplan>

# to apply
$ terraform apply
# OR to apply with plan file
$ terraform apply <filename.tfplan>

# to destroy
$ terraform destroy
```

## GCP
* Instance created with setup.sh
* To ssh, go to compute > ssh > get the gcloud cmd
* Connect with gcloud

## Start minikube
* In setup/install-tool.sh list the requirements to be install
* Run `$ curl https://raw.githubusercontent.com/wssnetwork/terra-gcp-minikube/master/setup/install-tool.sh | bash`

## For tutorial
* Ref: https://www.linuxtechi.com/how-to-install-minikube-on-ubuntu/ 