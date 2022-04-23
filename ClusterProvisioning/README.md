# Setup of a Kubernetes Cluster on Windows

The files included in this branch are used within my master thesis about `Kubernetes Forensics`. The files have been slightly changed and a new README has been provided as well, though the old one is kept [here](original_README.md). All changes can be followed through the commit history. 

As already stated, this branch aims to setup a Kubernetes cluster by using Vagrant and Ansible. Features of the WSL2 in windows are leveraged in order to provision the necessary VMs on a Windows host. You may read more about how to use WSL2 in order to provision VirtualBox VMs on Windows with Vagrant and Ansible [here](https://gist.github.com/pr3l14t0r/8b350fc7052ccee30a456596fa017c33).

When the cluster has been installed, you can fetch the `kubeconfig` file from the master node (vm) and add its path to an environment variable, in order to use it with `kubectl`. 

PowerShell commands: 
```powershell
# scp is natevily available in PowerShell and PowerShell Core
scp -P 2222 vagrant@127.0.0.1:/home/vagrant/.kube/config C:\Path\To\The\KubeConfig

# Set the environment variable
$Env:KUBECONFIG += ";C:\Path\To\The\KubeConfig"

# This did add the fresh exported KubeConfig to your KUBECONFIG env. variable.
# List the available configs now with kubectl
kubectl config get-contexts

# choose the one you want to use for your session
kubectl config use-context kubernetes-admin@kubernetes-forensics

# Test it with getting information about all pods
kubectl get Pods -A

# Or the overview of all nodes within the cluster
kubectl get nodes
```

Having the `kubeconfig` file exported to the host system and therefore being able to interact with the cluster provided on the VMs, everything is set up. \m/