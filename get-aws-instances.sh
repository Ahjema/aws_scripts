#!/bin/sh
# set up your aws creds first... aws configure
#This script will tell you what ec2 instances you have running.

for region in `aws ec2 describe-regions --output text | cut -f3`
do
     echo -e "\nListing Instances in region:'$region'..."
     aws --output table  ec2 describe-instances --region $region --query 'Reservations[].Instances[].[Tags[?Key==`Name`] | [0].Value,State.Name,InstanceId,InstanceType,Platform]'
done
