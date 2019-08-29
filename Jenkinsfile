#!/usr/bin/env groovy
pipeline {
  agent any

  stages {
stage("Parallel") {
    steps {
        parallel (
            "firstTask" : {
                //config-server
                  git url: 'ssh://git@bitbucket.org/$PROJ_NAME/$SERVICE_NAME.git'
            },
            "secondTask" : {
                //token-service
                git url: 'ssh://git@bitbucket.org/$PROJ_NAME/$SERVICE_NAME.git'
            }
        )
    }
}
    
    stage("Build") {
      steps {
        sh 'echo test123'
        sh 'mvn -v'
      }
    }

    stage("Testing") {
      parallel {
        stage("Unit Tests") {
          agent { docker 'openjdk:7-jdk-alpine' }
          steps {
            sh 'java -version'
          }
        }
        stage("Functional Tests") {
          agent { docker 'openjdk:8-jdk-alpine' }
          steps {
            sh 'java -version'
          }
        }
        stage("Integration Tests") {
          steps {
            sh 'java -version'
          }
        }
      }
    }

    stage("Deploy") {
      steps {
        echo "Deploy!"
      }
    }
  }
}
