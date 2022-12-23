# Codebreaker Compilation Server
Codebreaker Compilation Server

- Docker server built to run serverlessly on AWS Lambda as part of a grading step function
- Performs compilation on Ubuntu 20.04 stable release in line with [IOI 2022 regulations](https://ioi2022.id/contest-environment/))

### Repostiory Directory
- `app.py`: Main application file for Lambda function
- `awstools.py`: AWS tools file that manages S3 and dynamo interactions
- `compilesub.py`: Main logic that compiles C++ codes
- `in.sh`: Input template for lambda function

#### Local docker management
- `cleardocker.sh`: Clears all docker images locally
- `query.sh`: Sends localhosted lambda query
- `init.sh`: Opens local docker environment for localhost query by `query.sh`
- `upload.sh`: Uploads docker image into AWS ECR for linking with AWS Lambda 
