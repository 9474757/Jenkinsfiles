#!/usr/bin/env groovy
pipeline {
  agent any

  stages {
   stage ('Extract') {
    parallel 'Extract':{
      dir('project1') {
        git url: 'ssh://git@bitbucket.org/blockwrk/config-server.git'
      }
      dir('project2') {
        git url: 'ssh://git@bitbucket.org/blockwrk/opencart.git'
      }
      dir('project3') {
        git url: 'ssh://git@bitbucket.org/blockwrk/shimmer-service.git'
      }
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
