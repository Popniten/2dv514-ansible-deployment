#!/bin/bash

echo '. ~/Group02_project-openrc.sh' >> ~/.bashrc
echo 'eval `ssh-agent -s`' >> ~/.bashrc
echo 'chmod 700 ~/2dv514-g2-key.pem' >> ~/.bashrc
echo 'ssh-add ~/2dv514-g2-key.pem' >> ~/.bashrc

. ~/Group02_project-openrc.sh
eval `ssh-agent -s`
chmod 700 ~/2dv514-g2-key.pem
ssh-add ~/2dv514-g2-key.pem
