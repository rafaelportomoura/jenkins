FROM jenkins/jenkins:2.405-alpine

ARG PLUGINS_TXT_PATH=/usr/share/jenkins/ref/plugins.txt

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml

COPY ./jcasc/plugins.txt $PLUGINS_TXT_PATH
COPY ./jcasc/casc.yml /var/jenkins_home/casc.yaml

RUN jenkins-plugin-cli --plugin-file $PLUGINS_TXT_PATH
