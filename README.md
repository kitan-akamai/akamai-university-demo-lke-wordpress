# Akamai University Commpute Demo 

This repository is a demonstration highlighting how developers can leverage the core primitives of Akamai/Linode Cloud Platforms to seamlessly deploy cloud-native applications. Offering a glimpse into a day in the life of a software developer or cloud engineer, this demo covers key aspects such as app deployment, containerization, security, networking, Linode Cloud Manager, and Infrastructure-as-Code in less than 15 minutes hands-on session.

## Features

### 1. **Cloud-Native Application Deployment:**
   - Deploy a sample cloud-native application (this demo use WordPress) showcasing Akamai Cloud Platform's core primitives
   - Showcase Kubernetes as the central tenet of cloud-native architecture to orchestrate, deploy, and auto-scale application workloads

### 2. **Developer-Friendly Workflow:**
   - Showcase a seamless developer experience from code to deployment
   - Extensive APIs for integration with popular CI/CD tools for continuous deployment
   - Intuitive graphic interface designed to enhance developers' productity

### 3 **Security Best Practices:**
   - Implement security best practices for cloud-native applications, indifferent from any other public cloud platform
   - Showcase shared responsibility model inherent in public cloud environments

### 4 **Open Standards:**
   - Demonstrate Akamai's commitment to open standards, fostering interoperability and compatibility with other industry-leading tools and open frameworks
   - Showcase the inherent flexibility of Akamai Cloud in supporting open standards, enhancing versatility and seamless integration with diverse open-sourced technologies

## Prerequisites

- Linode account, can be created via  https://login.linode.com/signup 
- Linode Personal Access Token
- Git CLI
- Terraform CLI
- kubectl CLI

## Demo Steps

1. Clone this repository
   ```bash
   git clone https://github.com/kitan/akamai-university-demo-lke-wordpress.git
   cd akamai-university-compute-demo/wordpress-on-lke/
   ```

2. Execute Terraform 
   ```bash
   export TF_VAR_linode_token="your-token-goes-here"
   terraform init
   terraform plan
   terraform apply --auto-approve
   cd ..
   unset TF_VAR_linode_token
   ```

3. Retrieve External IP that exposes the WordPress service
   ```bash
   export KUBECONFIG=./wordpress-kubeconfig.yaml
   kubectl get svc
   ```

4. Access the WordPress web application

### Persona changed to Security Engineer
5. Create a new Kali instance using Cloud Manager UI

6. SSH into Kali using Terminal
   ```bash
   ssh root@[kali-ip-address]
   apt update
   ```

7. Install TightVNC, XFCE4
   ```bash
   apt install tightvncserver xfce4 -y
   ```

8. Install Zed Attack Proxy (or any other web application security testing tool)
   ```bash
   apt install zaproxy
   ```

9. Start VNC Server to create initial configuration
   ```bash
   tightvncserver
   ```

10. Modify VNC Server configuration
   ```bash
   tightvncserver -kill :1
   nano ~/.vnc/xstartup
   ```

11. Add XFCE as desktop environment, i.e.
   ```bash
   #!/bin/sh
   xrdb $HOME/.Xresources
   startxfce4 &
   ```

12. Start VNC server 
   ```bash
   tightvncserver
   ```

13. Create an SSH tunnel in a new terminal and connect to Kali via VNC
   ```bash
   ssh -L 61000:localhost:5901 -l root@[kali-ip-address]
   ```
   Use your favourite VNC viewer or using Finder

14. Open terminal in Kali, start zaproxy


## Disclaimer
The deployment provided in this repository is minimal and intended for demonstration purposes only.