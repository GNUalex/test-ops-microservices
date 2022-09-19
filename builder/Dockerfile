FROM jenkins/jenkins:lts-jdk11

LABEL MAINTAINER="Alex Aragon <alex.nogara@gmail.com>"

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /usr/share/jenkins/jenkins.yaml

COPY src/jobs /usr/share/jenkins/ref/jobs
COPY src/plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY src/jenkins.yaml /usr/share/jenkins/jenkins.yaml

RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
