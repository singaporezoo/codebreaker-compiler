# Gets ECR temporary password from AWS and uses that to login to docker
aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin [AWS ACCOUNT ID].dkr.ecr.ap-southeast-1.amazonaws.com
# Tags latest image and tags to ECR repository
# Uses docker image to get list of latest images
# docker build -t dockertest . to build new docker image
# If required, use cleardocker.sh to clear the docker containers not in use
docker tag [LATEST DOCKER IMAGE] [AWS ACCOUNT ID].dkr.ecr.ap-southeast-1.amazonaws.com/codebreaker-compilation
# Pushes new image to ECR (remember to rebuild in lambda)
docker push [AWS ACCOUNT ID].dkr.ecr.ap-southeast-1.amazonaws.com/codebreaker-compilation