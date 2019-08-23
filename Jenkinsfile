#!/usr/bin/env groovy
// Some fast steps to inspect the build server. Create a pipeline script job and add this:

node {
   DOCKER_PATH = sh (script: 'command -v docker', returnStdout: true).trim()
   echo "Docker path: ${DOCKER_PATH}"
   
   FREE_MEM = sh (script: 'free -m', returnStdout: true).trim()
   echo "Free memory: ${FREE_MEM}"
   
   echo sh(script: 'env|sort', returnStdout: true)
   
   SERVICE_NAME = 'config-server'
   echo "SERVICE_NAME = $SERVICE_NAME"
   PATH_REPO = '/opt/BWRK'
   echo "PATH_REPO = $PATH_REPO"
   mvnHome = '/opt/apache-maven-3.6.1'
   echo "mvnHome = $mvnHome"
   
   git 'ssh://git@bitbucket.org/blockwrk/$SERVICE_NAME.git'
   
   stage('Build') {
      // Run the maven build
      withEnv(["MVN_HOME=$mvnHome"]) {
         if (isUnix()) {
            sh '"$MVN_HOME/bin/mvn" -Dmaven.test.failure.ignore clean package'
         } else {
            bat(/"%MVN_HOME%\bin\mvn" -Dmaven.test.failure.ignore clean package/)
         }
      }
   }
}
