#!/bin/bash
rpm -qa | grep openjdk-1.8.0 &> /dev/null
if [ $? -eq 0 ]; then
    echo "Openjdk 1.8.0 in already installed. Meeting dependency"
    echo
else
    echo "Package openjdk is NOT installed! Installing Openjdk-1.8.0..."
    yum install -y java-1.8.0-openjdk
fi
    echo "-------Downloading Elastic Search PGP Key------"
    rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch

    cat << EOF > /etc/yum.repos.d/elasticsearch.repo
    [elasticsearch-6.x]
    name=Elasticsearch repository for 6.x packages
    baseurl=https://artifacts.elastic.co/packages/6.x/yum
    gpgcheck=1
    gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
    enabled=1
    autorefresh=1
    type=rpm-md
EOF
    echo "Installing Elasticsearch"
    yum install -y elasticsearch
    
    cat << EOF > /etc/yum.repos.d/logstash.repo
    [logstash-6.x]
    name=Elastic repository for 6.x packages
    baseurl=https://artifacts.elastic.co/packages/6.x/yum
    gpgcheck=1
    gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
    enabled=1
    autorefresh=1
    type=rpm-md  
EOF
    echo "Installing Logstash"
    yum install -y logstash
    
    cat << EOF > /etc/yum.repos.d/kibana.repo
    [kibana-6.x]
    name=Kibana repository for 6.x packages
    baseurl=https://artifacts.elastic.co/packages/6.x/yum
    gpgcheck=1
    gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
    enabled=1
    autorefresh=1
    type=rpm-md
EOF
    echo "Installing Kibana"
    yum install -y kibana 

