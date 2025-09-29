#!/bin/bash
#Base image taken from:https://github.com/cypress-io/cypress-docker-images
FROM cypress/browsers:node-20.11.0-chrome-121.0.6167.85-1-ff-120.0-edge-121.0.2277.83-1

#Create folder where our project will be stored
RUN mkdir /ss-ui-automation

#We make it our workdirectory
WORKDIR /ss-ui-automation

#lets copy essetial files that we must use to run the script

COPY package.json .

#Install the cypress dependencies in the work directory
RUN npm install

#Let's copy the essential files that we MUST use to run our scripts.
COPY . /ss-ui-automation

RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | tee /etc/apt/trusted.gpg.d/google.asc >/dev/null

#Install openssh-client,zip and unzip
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get dist-upgrade -y && \
    apt-get -y autoremove && \
    apt-get clean
RUN  apt-get install -y openssh-client
RUN apt-get install -y zip \
    unzip 

#Copy reportServer pem file
COPY reportServer.pem /ss-ui-automation
#Copy reportServer.sh file 
COPY reportServer.sh /ss-ui-automation
#Copy test.done file
COPY test.done /ss-ui-automation/cypress/

#Provide permission to pem and sh files
RUN chmod 400 reportServer.pem
RUN chmod 777 reportServer.sh

#Volume to report folder
VOLUME /ss-ui-automation/cypress/reports/

#With CMD in this case, we can specify more parameters to the last entrypoint.
CMD [""]
