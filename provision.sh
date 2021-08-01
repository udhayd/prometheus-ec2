#! /bin/bash

##################################################################################################################
####  Description: Wrapper Script to create a AWS Cloudformation Stack for Local Managed monitoring nodes     ####
####  Version: 1.0v                                                                                           ####
####  Usage: ./provision.sh -n stackname                                                                      ####
##################################################################################################################


#### Function for help
usage() {
    echo "Usage: $0 [options]"
    
    echo " -n, --name  name of stack"
}

#### To validate the Arguments
if [ $# -eq 2 ]
then
    echo "Executing Script"
    aws cloudformation list-exports|grep "MyVPCID" >/dev/null 2>&1
    if [ $? -ne 0 ]
    then
      echo ""
      echo "Network stack doesnt exist, Executing VPC Stack First ..."
      cd vpc
      ./provision.sh -n $2-vpc
      echo ""
      cd ../
      echo "Executing EC2 Stack ..."
    fi
else
    usage
    exit
fi

#### Varible Initialization
echo "EC2_STACK_NAME=$2-monitoring" >vars.sh
source vars.sh
set -ex

#### salt Stack Creation
aws cloudformation deploy --template-file mon.yaml --stack-name $EC2_STACK_NAME --no-fail-on-empty-changeset --capabilities CAPABILITY_IAM
