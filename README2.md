1. Create key pair (name: `2dv514-g2-key`) in LabCloud
2. Download and run the `openrc`-file
3. Run `ansible-playbook initial-deploy.yml` on local machine
4. Make sure you can SSH into the controlmachine
5. `scp` openrc-file and key to controlmachine
   `scp <filename> ubuntu@<floating_ip>:/home/ubuntu`
6. Run `scripts/init.sh` on controlmachine
7. Run `ansible-playbook deploy-instances.yml` from controlmachine
8. Add all servers to inventory manually (?)
9. Run `ansible-playbook -i production-inventory provision-instances.yml`
