#!/bin/sh
if [ -z "${AWS_LAMBDA_RUNTIME_API}" ]; then
  exec /usr/local/bin/aws-lambda-rie python3.8 -m awslambdaric $@
else
  exec python3.8 -m awslambdaric $@
fi     