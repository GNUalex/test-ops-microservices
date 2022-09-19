#!/bin/sh

echo "curl -H 'Host: builder.localhost.com' http://jenkins-service:8080/job/pipeline-job/build?token=${JENKINS_TOKEN}"
curl -H "Host: builder.localhost.com" http://jenkins-service:8080/job/pipeline-job/build?token=${JENKINS_TOKEN}
