#!/usr/bin/env groovy

pipeline {
    agent { dockerfile true }
    stages {
        stage('Pre-build cleanup') {
            when {
                branch 'PR-*'
            }
            steps {
                echo "Current build display name set to: ${currentBuild.displayName}"
                script {
                    currentBuild.displayName = "# ${env.BUILD_NUMBER} - ${env.CHANGE_TITLE}"
                }
            }
        }

        stage('Build') {
            when {
                branch 'PR-*'
            }
            steps {
                sh 'npm i'
            }
        }

        stage('QA') {
            when {
                branch 'PR-*'
            }
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
