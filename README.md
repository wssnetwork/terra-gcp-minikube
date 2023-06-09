# terra-gcp-minikube

## Before Terraform
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
* To setup, in GCP connect via ssh-browser and upload the file from script/setup.sh
* Run the bash script

## For tutorial
Ref: https://www.linuxtechi.com/how-to-install-minikube-on-ubuntu/ 