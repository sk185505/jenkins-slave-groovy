#rkalluru/jenkins:v1
FROM jenkinsci/jenkins:lts-alpine
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
COPY security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy
COPY seeddsl.groovy /usr/share/jenkins/seeddsl.groovy
COPY dockerslave.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY config.xml /usr/share/jenkins/seed-job-config.xml
COPY create-seed-job.groovy /usr/share/jenkins/ref/init.groovy.d/create-seed-job.groovy
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY install-plugins.sh /usr/local/bin/install-plugins.sh 
USER root
RUN chmod +x /usr/local/bin/install-plugins.sh 
USER jenkins
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
