#!/bin/bash
yum update -y
cd /tmp
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u141-b15/336fa29ff2bb4ef291e347e091f7f4a7/jdk-8u141-linux-x64.rpm
rpm -ivh jdk-8u141-linux-x64.rpm
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
yum install jenkins --nogpgcheck -y
yum install git -y
systemctl start jenkins
systemctl enable jenkins
echo "jenkins  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
