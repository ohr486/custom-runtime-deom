#!/bin/bash

ROLE_ARN="arn:aws:iam::800832305859:role/exec-lambda"

aws lambda create-function \
  --function-name bash-runtime \
  --zip-file fileb://bash-runtime/function.zip \
  --handler function.handler \
  --runtime provided \
  --role $ROLE_ARN
