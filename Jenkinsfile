#!/usr/bin/env groovy
pipeline {
  agent any

  stages {
    stage("Build") {
      steps {
        sh 'echo test123'
        sh 'git fetch ssh://git@bitbucket.org/blockwrk/config-server.git'
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
