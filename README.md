# node-express-api
---
## Introduction
This is a simple restful API written using nodejs that returns Moscow time

### Content

1. How to run the app
2. How to dockerize and run with docker?
3. How to Deploy in AWS EC2?
    3.1 Provisioning EC2 using Terraform  <br />
    3.2 Bootstrapping the deployment of the API using Ansible

---
## 1. How to run
1. Prerequisite
   1. Clone the Github repository.
   2. Have `npm` and `nodejs` installed
2. `cd` to `src` directory.
3. Run `npm init` this will install the required packages
4. Run the app with either `node index.js` or `npm start`
5. Access `http://localhost:8080` from the browser.

## 2. How to dockerize and run with docker?

1. Clone the Github repository and build with `sudo docker build -t <name> .`.
2. Run the image  <br /> `sudo docker run -itd -p 8080:8080 <name>`.
3. Access `http://localhost:8080` from the browser.

### 2.1 Note about dockerfile
   I used multiple build stage to reduce the size of the image from 900MB to ~65MB, I can even reduce the final image further to about 7MB by building on alpine image but that's not best practice
#### Best approaches for secure docker image

- Deploy the app with the least user privilege
- Installing dependencies under non-root user directory
- Check the docker image in snyk.io to identify  the vulnerabilities
- Take care of exposing ports.

Note: The built image can be found [here](https://hub.docker.com/repository/docker/shreddedcheese/node-express-api)

---
## 3. How to Deploy in AWS EC2?
### 3.2 Provisioning EC2 using Terraform
**Pre-requisites installation:**

- Install & configure AWS-CLI (access and secret keys)
- Install Terraform
- Install AWS-iam-authenticator


### 3.2 Integration of Terraform and Ansible
The playbooks can be found in `ansible/roles`, the terrform template is written in such a way that you only need to do `terraform apply` to have the server running, no need to types ansible commands

**Follow below steps:**
1. Clone the Github repository.
2. *cd* to *infrastructure* directory.
3. Prepare and download modules `terraform init --upgrade=true`
4. Plan and test deployment `terraform plan -out plan`
5. Deploy cluster `terraform apply --auto-approve` wait a while then type `yes`
6. You can find the IP in `ansible/inventory`, the file is augmented dynamically with terraform's `local_exec` resource
7. Acccess through browser `IP:443`