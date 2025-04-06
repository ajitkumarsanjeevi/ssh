#!/bin/bash
aws configure set aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
aws configure set aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
aws configure set aws-region:  ${{ env.Region }}
aws s3 ls
