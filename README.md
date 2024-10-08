# Overview

This repository provides a template for deploying an LKE cluster with the [Linode LKE Firewall Controller](https://github.com/linode/cloud-firewall-controller).   If you need to deploy LKE clusters frequently for testing and experimentation this repo can help streamline your ability to deploy a starting cluster that is secured with a sane default set of firewall rules.  The idea is that it provides you with something that works immediately out-of-the-box but also allows you to use as an initial template that you can take pieces from for building your own project.

## How to Use

1. Clone this repo locally.
2. Ensure you have [Terraform CLI installed](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli).
3. Setup the Linode provider with local configuration for authentication or setup the token as an environment variable per the [documentation](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli).
    1. If you are using a local config file with your API token it attempts to set the environment variable from that.  
    2. If you are not using a local configuration file then you should set the `LINODE_TOKEN` environment variable with your API token before running
4. Modify the [`deploy.sh`](http://deploy.sh) file to be executable.
5. To create a cluster with the default settings in the script you can run `./deploy.sh` and it will provision a 3-node LKE cluster by default using shared 2GB instances and apply the cloud firewall controller with default firewall rules
6. To destroy your cluster and the associated firewall it created you can run `./deploy.sh destroy`

## Configuration Options

This repo was intentionally kept simple to act as a template or to use as a basic demonstration for deploying LKE with a default secure firewall.  There are a few configurable elements in [`deploy.sh`](http://deploy.sh) including:

- `K8S_VERSION` which corresponds to a current supported version of Kubernetes on LKE
- `linode_credentials_file` which can be changed if your file is hosted elsewhere than the default location that Terraform uses

You could also setup a `terraform.tfvars` file in the `terraform/provision-lke` directory if you wanted to override any default variables provided for the deployment.  This repo wasn’t meant to enable extensive configuration and that is left for those consuming this repo to fork and use for their own projects if desired.  This repo without additional configuration will give you a starting cluster that you can then use to run imperative commands against for experimenting while having a more secure and compliant default set of firewall rules applied.