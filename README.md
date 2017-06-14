# Consul Deployment and Configuration

## Overview

This project provides a comprehensive demonstration of

  * deploying a Consul server cluster
  * deploying a client and registering services and health checks
  * setting up Consul DNS resolution inside docker containers

## Pre-requisites

  * `ansible >= 2.2`
  * `Docker >= 1.12.0`
  * `Virtualbox >= 5.122`
  * `Vagrant >= 1.9.5` with `vagrant-vbagent` plugin
  * a recent `go` distribution to compile examples in `services/`

Everything has been tested only on OS X 10.11.6 so far.

## Usage

### Build Consul Docker image

Navigate to `/consul` and run `make build`. The image does not need to be pushed to a remote repository. It will later be exported in to a directory shared with the VM where Ansible will load it from file using `docker_image` module.

### Compile test services

Navigate to each of the directories under `services/` and run `make image`. Code will be cross-compiled and wrapped in Docker images.

### Build the "pre-image"

Navigate to `vagrant/build/pre` and run `./build.sh`. This step is not strictly necessary for the demonstration, however, it adds a kernel upgrade for better support of the more recent versions of Docker. In particular, it enables the use of `overlay` and `overlay2` storage drivers.

### Build the base image

Navigate to `vagrant/build/base` and run `./build.sh`. This image inherits from the one built in the previous step and sets up docker and bind, the latter configured to accept `.consul` queries from Docker bridge.

### Build the server and client images

Navigate to the respective directories under `vagrant/build/` and run `./build.sh`. Each of these deploys Consul agents with some shared settings. Refer to `consul`, `consul-server` and `consul-client` Ansible roles for full details. Note that Consul containers are not started immediately, because some important bits of configuration, such as node name, address to adverties and nodes to join are not available at this stage. They will be added at machine startup phase.

### Start Consul servers and clients

Navigate to the respective directories under `vagrant/run` and run `vagrant up`. You can then interact with the cluster via the host-mapped ports.
