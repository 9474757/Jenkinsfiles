pipeline {
    agent any
    environment { 
        SERVICE_NAME = 'api-gateway'
        PATH_REPO = '/opt/BWRK'
    }
    stages {
        stage("fetch svn") {
            steps {
                parallel (
                    "$SERVICE_NAME" : {
                        sh "echo fetch $SERVICE_NAME"
                        sh "cd $PATH_REPO && git fetch ssh://git@bitbucket.org/blockwrk/$SERVICE_NAME.git"
                        sh "echo 'Git fetch done' > /tmp/j.log" 
                    })
                }
            }
        }
    }  
