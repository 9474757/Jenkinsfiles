#!/usr/bin/env groovy
// Some fast steps to inspect the build server. Create a pipeline script job and add this:

node {
   DOCKER_PATH = sh (script: 'command -v docker', returnStdout: true).trim()
   echo "Docker path: ${DOCKER_PATH}"
   
   FREE_MEM = sh (script: 'free -m', returnStdout: true).trim()
   echo "Free memory: ${FREE_MEM}"
   
   echo sh(script: 'env|sort', returnStdout: true)
   
   SERVICE_NAME = "config-server"
   echo "SERVICE_NAME = $SERVICE_NAME"
   PATH_REPO = '/opt/BWRK'
   echo "PATH_REPO = $PATH_REPO"
   mvnHome = '/opt/apache-maven-3.6.1'
   echo "mvnHome = $mvnHome"
   
   echo "CHECK OUT REPO $SERVICE_NAME"
   git "ssh://git@bitbucket.org/blockwrk/$SERVICE_NAME.git"
   
            steps {
                script {
                    sshagent(['ci-ssh']) {
                        sh """

PORT_SERVICE=$(cat ./Dockerfile | grep EXPOSE | grep -o '[^EXPOSE ]*$')
rm -R target
mvn -Dmaven.test.failure.ignore clean package

cat <<EOF > Dockerfile_slim_image
FROM openjdk:8-jdk-alpine
EXPOSE $PORT_SERVICE
COPY target/config-server-*-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
EOF

docker build -f ./Dockerfile_slim_image -t $SERVICE_NAME:8-jdk-alpine_3 -t $SERVICE_NAME:latest .

                        """
                    }
                }}
   
}
