FROM public.ecr.aws/lts/ubuntu:20.04_stable
ENV PYTHONIOENCODING="utf8"
# See: https://docs.aws.amazon.com/lambda/latest/dg/images-create.html

RUN apt-get update
RUN  apt -y install -y g++ \
    cmake \
    libtool \
    autoconf \
    python3.8 \
    curl

# Install pip, prob can pre-download and dont use curl
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3.8 get-pip.py

# Install the runtime interface client
RUN python3.8 -m pip install awslambdaric 
COPY ./entry_script.sh /entry_script.sh
ADD aws-lambda-rie-arm64 /usr/local/bin/aws-lambda-rie
ENTRYPOINT [ "/entry_script.sh" ]

# Install AWS CLI
RUN python3.8 -m pip install awscli
RUN python3.8 -m pip install boto3

# Copy function code
COPY app.py ${LAMBDA_TASK_ROOT}
COPY awstools.py ${LAMBDA_TASK_ROOT}
COPY compilesub.py ${LAMBDA_TASK_ROOT}
COPY testlib.h ${LAMBDA_TASK_ROOT}

CMD [ "app.lambda_handler" ] 
