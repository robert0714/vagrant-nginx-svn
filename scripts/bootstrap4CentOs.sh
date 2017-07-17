#!/bin/bash

#set -e

echo "Installing Nginx  on CentOS..." 

A=`yum info nginx`

testing=`[[ $A =~ 'nginx' ]]`

echo $testing

echo  "############# ${testing} ##############"
 
if [[ $testing != ""  ]]; then
     echo "Nginx is already installed."
else
      echo "Nginx is not installed."
      yum install -y wget
      rpm -Uvh  http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-9.noarch.rpm 
      rpm -Uvh  http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm

      
fi

yum  install -y nginx

yum  install -y httpd subversion mod_dav_svn


yum update -y
