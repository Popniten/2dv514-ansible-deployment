# Provision VM on OpenStack with Ansible

## Initial setup

Folder `initial-setup` contains the playbooks to set up the network, router and control machine on LabCloud. Run this from a local computer. After this, ssh into the controlmachine and run all subsequent playbooks from there. `host_key_checking = False` should be uncommented in `/etc/ansible/ansible.cfg` on your local machine.

**Important!** Before running the initial setup, the OpenStack RC file needs to be downloaded to the local folder, as well as the private key to transfer to the controlmachine needs to be here.

After this, anyone with access to the controlmachine _should_ be able to SSH into it and run ansible playbooks against the LabCloud, and the instances inside.

**Note!** The first time when SSHing into the machine after its creation, run these commands:

```bash
echo '. ~/project/Group02_project-openrc.sh' >> ~/.bashrc && \
echo 'eval `ssh-agent -s`' >> ~/.bashrc && \
echo 'chmod 700 ~/project/2dv514-g2-key.pem' >> ~/.bashrc && \
echo 'ssh-add ~/project/2dv514-g2-key.pem' >> ~/.bashrc

# Exit SSH session, and log back in for it to take effect

# For each SSH host? Probably no.
echo 'ssh-keygen -f "/home/ubuntu/.ssh/known_hosts" -R 194.47.164.48' >> ~/.bashrc

# Disable known hosts checking
sudo nano /etc/ansible/ansible.cfg
# Uncomment 'host_key_checking = False'
```

Use [dynamic inventory](http://docs.ansible.com/ansible/latest/intro_dynamic_inventory.html#example-openstack-external-inventory-script)

```bash
wget https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/openstack.py
chmod +x openstack.py
source openstack.rc
./openstack.py --list
```

## Workflow

...

Start off by creating a number of servers to hosts your swarm the role create_instances is in charge of this action

```bash
ansible-playbook site.yml
```

When the servers are created populate your inventory file in this case the file called *hosts* with the private IPs of these new servers. After this is done we re run the *site.yml* playbook to provision the nodes. 

```bash
ansible-playbook site.yml -i hosts
```

Once provisioning is done we setup the swarm cluster using the *swarm.yml* playbook. 

```bash
ansible-playbook swarm.yml -i hosts
```

## Congragulations! You have successfuly deployed your Web services to a swarm cluster.
