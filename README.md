# Prometheus-Grafana Node Monitoring

## Infrastructure As a Code to create VPC & EC2 instance to start with Cloudformation.
## Following scripts creates Network stack and Ec2 instances prometheus & grafana Installed for node Monitoring.

PREQUISITES : aws cli to be installed (Or) please execute below steps from aws cloud shell .

## To download the script

$ cd prometheus-ec2/

## To Create the Stack
$ ./provision.sh -n "name of stack"

## To Destroy the Stack
$ ./destroy.sh

## To Access the grafana
Please access grafana through public ip of 'master' node http://ipaddress:3000

## To Access the prometheus
Please access prometheus through public ip of 'master' node http://ipaddress:9090
