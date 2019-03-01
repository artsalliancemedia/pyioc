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
        PYIOC_REPOSITORY_URL = "https://upload.pypi.org/legacy/"
        PYIOC_PYPI_USERNAME = credentials('PYIOC_PYPI_USERNAME')
        PYIOC_PYPI_PASSWORD = credentials('PYIOC_PYPI_PASSWORD')
    }
    stages {

        stage('SetUp') {
            steps {
                sh "bin/clean_up.sh"
            }
        }


        stage('Unit Tests') {
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
                    }
                }
            steps {
                sh "docker/build_packages.sh"
            }
            post {
                success {
                    archiveArtifacts 'dist/*'
                }
            }

        }

        stage('Publish Packages') {

            when {
                    allOf {
                          expression { !currentBuild.result }
                          branch 'master'
                    }
                }
            steps {
                sh "docker/publish_packages.sh"
            }

        }
    }
    post {
        always {
            sh "bin/clean_up.sh"
        }
    }
}