#!/bin/bash

DATE=$(date +%Y-%m-%d-%H-%M)

echo "Starting EC2 Backup Process..."

VOLUMES=$(aws ec2 describe-volumes --query 'Volumes[*].VolumeId' --output text)

for VOLUME in $VOLUMES
do
    echo "Creating snapshot for volume: $VOLUME"

    aws ec2 create-snapshot \
    --volume-id $VOLUME \
    --description "Automated Backup $DATE"

    echo "Snapshot created for $VOLUME"
done

echo "Backup process completed!"
