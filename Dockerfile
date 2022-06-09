FROM jenkinsci/blueocean
USER root
RUN apk add --update docker docker-compose
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /usr/local/jcasc.yaml
COPY jcasc.yaml /usr/local/jcasc.yaml
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
RUN jenkins-plugin-cli --plugins configuration-as-code
USER jenkins