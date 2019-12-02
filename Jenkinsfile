#!/usr/bin/env groovy

pipeline {
    agent { dockerfile true }
    stages {
        stage('Pre-build cleanup') {
            steps {
                echo "Current build display name set to: ${currentBuild.displayName}"
                script {
                    currentBuild.displayName = "# ${env.BUILD_NUMBER} - ${env.CHANGE_TITLE}"
                }
            }
        }

        stage('Build') {
            steps {
                sh 'npm i'
            }
        }

        stage('QA') {
            parallel {
                stage('Code quality analysis') {
                    steps {
                        sh 'npm run lint'
                    }
                }

                stage('Tests') {
                    steps {
                        sh 'npm run test'
                    }                   
                }
            }
        }
    }
}
