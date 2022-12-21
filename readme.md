# Codebreaker Compilation Server
Codebreaker Compilation Server

<li> Docker server built to run serverlessly on AWS Lambda as part of a grading step function
<li> Performs execution on Ubuntu 20.04 stable releasein line with [IOI 2022 regulations](https://ioi2022.id/contest-environment/))


### Repostiory Directory

<li> ```app.py```: Main application file for Lambda function
<li> ```awstools.py```: AWS tools file that manages S3 and dynamo interactions
<li> ```compilesub.py```: Main logic that compiles C++ codes
<li> ```in.sh```: Input template for lambda function

#### Local docker management
<li> `cleardocker.sh`: Clears all docker images locally
<li> `query.sh`: Sends localhosted lambda query
<li> `init.sh`: Opens local docker environment for localhost query by `query.sh`
<li> `upload.sh`: Uploads docker image into AWS ECR for linking with AWS Lambda 