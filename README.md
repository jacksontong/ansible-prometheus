# Ansible Tutorial for Monitoring with Prometheus and Grafana

This tutorial demonstrates how to set up a monitoring solution using Prometheus and Grafana on two virtual machines (VMs) created with Vagrant. One VM will host Prometheus, and the other will act as a web server with Node Exporter installed for monitoring.

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Setup and Installation](#setup-and-installation)
- [Ansible Roles](#ansible-roles)
- [Running the Playbook](#running-the-playbook)
- [Accessing Prometheus and Grafana](#accessing-prometheus-and-grafana)
- [Conclusion](#conclusion)
- [Troubleshooting](#troubleshooting)

## Overview

This project utilizes Ansible to automate the installation and configuration of the following components:

- **Prometheus**: An open-source systems monitoring and alerting toolkit.
- **Grafana**: An open-source analytics platform for monitoring and observability.
- **Node Exporter**: A Prometheus exporter for hardware and OS metrics exposed by \*NIX kernels.

The setup consists of two VMs:

1. **Prometheus Server**: Hosts Prometheus for collecting and storing metrics.
2. **Web Server**: Runs Node Exporter to provide metrics to Prometheus.

## Prerequisites

Before you begin, ensure you have the following installed on your local machine:

- **Vagrant**: [Download Vagrant](https://www.vagrantup.com/downloads)
- **VirtualBox**: [Download VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- **Ansible**: [Installation Guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- **Git**: [Download Git](https://git-scm.com/downloads)

## Setup and Installation

1. **Clone the Repository**

   Clone this repository to your local machine using Git:

   ```bash
   git clone https://github.com/jacksontong/ansible-prometheus
   cd ansible-prometheus
   ```

2. **Vagrant Setup**

   Initialize the Vagrant environment by navigating to the project directory and running:

   ```bash
   make gen-ssh
   vagrant up
   ```

   This command will create two VMs: one for Prometheus and another for the web server.

## Ansible Roles

The Ansible playbooks and roles are organized under the `ansible` folder:

### Roles

- **Prometheus**: Installs and configures Prometheus.
- **Grafana**: Installs and configures Grafana.
- **Prometheus_Exporter**: Installs Node Exporter on the web server VM for collecting system metrics.

Each role is structured with tasks, handlers, templates, and variables to ensure modularity and reusability.

### Directory Structure

```plaintext
ansible/
├── playbook.yaml
├── roles/
│   ├── prometheus/
│   │   ├── tasks/
│   │   ├── handlers/
│   │   ├── templates/
│   │   ├── vars/
│   │   ├── defaults/
│   │   └── meta/
│   ├── grafana/
│   │   ├── tasks/
│   │   ├── handlers/
│   │   ├── templates/
│   │   ├── vars/
│   │   ├── defaults/
│   │   └── meta/
│   └── prometheus_exporter/
│       ├── tasks/
│       ├── handlers/
│       ├── templates/
│       ├── vars/
│       ├── defaults/
│       └── meta/
└── inventory.yaml
```

## Running the Playbook

1. **Run the Ansible Playbook**

   Execute the playbook to set up Prometheus, Grafana, and Node Exporter:

   ```bash
   make ansible-play
   ```

   This command will configure the VMs based on the specified roles.

## Accessing Prometheus and Grafana

Once the playbook has been executed successfully, you can access Prometheus and Grafana through your browser.

### Prometheus

- **URL**: http://192.168.60.60:9090
- **Description**: Use Prometheus to explore collected metrics and create custom queries.

### Grafana

- **URL**: http://192.168.60.60:3000
- **Default Username**: `admin`
- **Default Password**: `admin`
- **Description**: Use Grafana to visualize metrics and create dashboards. After logging in, you'll be prompted to change your password.

### Node Exporter

Node Exporter runs on the web server VM:

- **Metrics URL**: http://192.168.60.61:9100/metrics
- **Description**: Node Exporter provides hardware and OS metrics for monitoring.

## Conclusion

This tutorial demonstrates how to use Ansible and Vagrant to automate the setup of a monitoring solution using Prometheus and Grafana. By leveraging Ansible roles, you can easily extend this setup to include additional exporters or monitoring targets.

## Troubleshooting

- **Vagrant Errors**: Ensure Vagrant and VirtualBox are correctly installed and updated. Recreate VMs if necessary with `vagrant destroy -f && vagrant up`.
- **Ansible Issues**: Check syntax and connectivity issues by running Ansible in verbose mode (`make ansible-play -vvv`).
- **Prometheus/Grafana Access**: Ensure the services are running (`sudo systemctl status prometheus` or `grafana-server`). Verify firewall settings if necessary.
