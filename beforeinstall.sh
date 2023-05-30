#!/bin/bash -xe
cd /home/ec2-user
sudo rm -rf *
wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
yum install -y apache-maven
yum install java-1.8.0-openjdk-devel.x86_64 -y
yum install zip -y
PID=`ps -eaf | grep webapp | grep -v grep | awk '{print $2}'`
if [[ "" !=  "$PID" ]]; then
  echo "killing $PID"
  kill -9 $PID
fi
