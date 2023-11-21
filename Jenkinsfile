pipeline {
    agent any
    
    stages {
        stage('Clone Repository') {
            steps {
                script {
                    checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/nafrinmeir/CAPI.git']]])
                }
            }
        }

        stage('Build and Package') {
            steps {
                script {
                    docker.image('maven:3.8.3-openjdk-11').inside {
                        sh 'mvn clean package'
                    }
                }
            }
        }

        stage('Build Nginx Image') {
            steps {
                script {
                    docker.build('nginx-capi', '-f Dockerfile.nginx .')
                }
            }
        }

        stage('Run Nginx Container') {
            steps {
                script {
                    docker.run('-p 8010:80 --name nginx-capi nginx-capi')
                }
            }
        }
     
        stage('Verify Docker') {
            steps {
                script {
                    sh 'docker --version'
                }
            }
        }
     }   
}
