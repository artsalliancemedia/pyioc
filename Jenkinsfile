#!/usr/bin/env groovy

pipeline {
    agent {
        label {
            label 'docker'
        }
    }
    options {
        timestamps()
        timeout(time: 30, unit: 'MINUTES')
    }
    environment {
        PYIOC_PATCH_VERSION = "${env.BUILD_NUMBER}"
    }
    stages {
        stage('Unit Tests') {
        }

        stage('GUI Tests') {
            steps {
             parallel(
                        "3.4": {
                            withEnv([
                                    "PYTHON_VERSION=3.4"
                            ]) {
                                    sh "docker/run_tests.sh"
                            }
                        },
                        "3.5": {
                            withEnv([
                                    "PYTHON_VERSION=3.5"
                            ]) {
                                    sh "docker/run_tests.sh"
                            }
                        },
                        "3.6": {
                            withEnv([
                                    "PYTHON_VERSION=3.6"
                            ]) {
                                    sh "docker/run_tests.sh"
                            }
                        },
                        "latest": {
                            withEnv([
                                    "PYTHON_VERSION=3"
                            ]) {
                                    sh "docker/run_tests.sh"
                            }
                        }
                )
            }
            post {
                always {
                    junit 'reports/*.xml'
                }
            }
        }


        stage('Build Packages') {

            when {
                    allOf {
                          expression { !currentBuild.result }
                          branch 'develop'
                    }
                }
            steps {
                sh "echo build"
            }

        }

        stage('Publish Packages') {

            when {
                    allOf {
                          expression { !currentBuild.result }
                          branch 'develop'
                    }
                }
            steps {
                sh "echo publish"
            }

        }
    }
    post {
        always {
            sh "echo clean-up-workspace"
        }
    }
}