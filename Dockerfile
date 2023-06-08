FROM jenkins/jenkins:latest
USER root
#RUN apk add --update docker docker-compose
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /usr/local/jcasc.yaml
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/plugins.txt
COPY jcasc.yaml /usr/local/jcasc.yaml
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
# RUN jenkins-plugin-cli --plugins \
#     matrix-auth \
#     configuration-as-code \
#     workflow-job \ 
#     gradle \
#     nexus-artifact-uploader \ 
#     pipeline-model-definition \ 
#     urltrigger \ 
#     extended-choice-parameter \ 
#     parameter-separator \
#     blueocean-core-js \
#     git-client \ 
#     resource-disposer \ 
#     h2-api \ 
#     delivery-pipeline-plugin \
#     jsunit \
#     credentials-binding \
#     blueocean-personalization \ 
#     blueocean-display-url \ 
#     jackson2-api \ 
#     display-url-api \ 
#     handy-uri-templates-2-api \ 
#     antisamy-markup-formatter \ 
#     blueocean-web \ 
#     mapdb-api 
#     pipeline-stage-view \ 
#     workflow-aggregator \
#     bitbucket \
#     jira-trigger \ 
#     stashNotifier \ 
#     ansible \ 
#     script-security \ 
#     uno-choice \ 
#     workflow-api \ 
#     sse-gateway \ 
#     global-build-stats \ 
#     blueocean-rest-impl \ 
#     plain-credentials \ 
#     kubernetes-cli \ 
#     android-signing \ 
#     junit \ 
#     build-environment \
#     ssh-agent \ 
#     cloudbees-bitbucket-branch-source \ 
#     jaxb \ 
#     artifact-promotion \ 
#     workflow-support \ 
#     pipeline-build-step \ 
#     docker-commons \ 
#     javatest-report \ 
#     role-strategy \ 
#     jdk-tool \ 
#     pipeline-rest-api \ 
#     jira \ 
#     credentials \ 
#     dashboard-view \ 
#     publish-over-ssh \ 
#     azure-commons \ 
#     blueocean-git-pipeline \ 
#     log-parser \ 
#     build-metrics \ 
#     nexus-jenkins-plugin \ 
#     jquery-detached \ 
#     rebuild \ 
#     xunit \ 
#     selected-tests-executor \ 
#     git-parameter \ 
#     jenkins-design-language \ 
#     discard-old-build \ 
#     config-file-provider \ 
#     build-user-vars-plugin \ 
#     workflow-basic-steps \ 
#     blueocean-bitbucket-pipeline \ 
#     blueocean-commons \ 
#     azure-credentials \ 
#     bouncycastle-api \ 
#     matrix-project \
#     conditional-buildstep \ 
#     scm-api \ 
#     workflow-step-api \ 
#     test-results-analyzer \ 
#     email-ext \ 
#     trilead-api \ 
#     build-timeout \ 
#     snakeyaml-api \ 
#     content-replace \ 
#     promoted-builds \ 
#     ivy \ 
#     jsch \ 
#     simple-theme-plugin \ 
#     github-api \ 
#     ssh-steps \ 
#     pipeline-input-step \ 
#     docker-java-api \ 
#     http_request \ 
#     oauth-credentials \ 
#     cloudbees-folder \ 
#     github-branch-source \ 
#     kubernetes-client-api \ 
#     ws-cleanup \ 
#     docker-plugin \ 
#     blueocean-dashboard \ 
#     ssh-credentials \ 
#     pipeline-graph-analysis \ 
#     vstestrunner \ 
#     nunit \ 
#     okhttp-api \ 
#     pubsub-light \ 
#     blueocean \ 
#     bitbucket-approve \ 
#     msbuild \ 
#     htmlpublisher \ 
#     google-oauth-plugin \ 
#     pipeline-model-declarative-agent \ 
#     cloud-stats \ 
#     subversion \ 
#     maven-plugin \ 
#     html5-notifier-plugin \ 
#     git-server \ 
#     workflow-durable-task-step \ 
#     multiple-scms \ 
#     jquery-ui \ 
#     pipeline-github-lib \ 
#     pipeline-multibranch-defaults \ 
#     external-monitor-job \ 
#     blueocean-jwt \ 
#     lockable-resources \ 
#     kubernetes \ 
#     ssh-slaves \ 
#     blueocean-events \ 
#     pipeline-maven \
#     view-job-filters \ 
#     momentjs \ 
#     pipeline-model-api \ 
#     blueocean-pipeline-api-impl \ 
#     structs \ 
#     folder-auth \ 
#     branch-api \ 
#     jenkins-jira-issue-updater \ 
#     blueocean-autofavorite \ 
#     timestamper \ 
#     git \ 
#     jquery \ 
#     handlebars \ 
#     release \ 
#     pipeline-milestone-step \ 
#     ansicolor \ 
#     pam-auth \ 
#     build-with-parameters \ 
#     azure-vm-agents \ 
#     windows-slaves \ 
#     pipeline-stage-tags-metadata \ 
#     jobConfigHistory \ 
#     winrm-client \ 
#     workflow-multibranch \ 
#     blueocean-config \ 
#     blueocean-pipeline-editor \ 
#     environment-dashboard \ 
#     token-macro \ 
#     bitbucket-build-status-notifier \ 
#     blueocean-pipeline-scm-api \ 
#     workflow-cps-global-lib \ 
#     ant \ 
#     github \ 
#     blueocean-jira \ 
#     saml \ 
#     hidden-parameter \ 
#     blueocean-i18n \ 
#     allure-jenkins-plugin \ 
#     ssh \ 
#     python \ 
#     sonar \ 
#     workflow-cps \ 
#     JiraTestResultReporter \ 
#     mercurial \ 
#     command-launcher \ 
#     blueocean-rest \ 
#     variant \ 
#     favorite \ 
#     git-changelog \ 
#     javadoc \ 
#     postbuild-task \ 
#     copyartifact \ 
#     ldap \ 
#     active-directory \ 
#     blueocean-github-pipeline \ 
#     pipeline-stage-step \ 
#     kubernetes-credentials \
#     jobcopy-builder \ 
#     docker-workflow \ 
#     run-selector \ 
#     pipeline-utility-steps \ 
#     backup \ 
#     TestFairy \ 
#     sonar-quality-gates \ 
#     artifactory \ 
#     workflow-scm-step \ 
#     durable-task \ 
#     authentication-tokens \ 
#     powershell \ 
#     ace-editor \ 
#     pipeline-model-extensions \ 
#     mongodb-document-upload \ 
#     run-condition \ 
#     mailer \ 
#     dtkit-api \ 
#     cppcheck \ 
#     parameterized-trigger \ 
#     publish-over 
#     apache-httpcomponents-client-4-api

USER jenkins