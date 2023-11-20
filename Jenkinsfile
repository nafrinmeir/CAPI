pipeline {
    agent any
    
    stages {
        stage('Clone') {
            steps {
                git(
                    url: "https://github.com/nafrinmeir/CAPI.git",
                    branch: "main",
                    changelog: true,
                    poll: true
                )
            }
        }
        
    stage('Build Docker Image') {
        steps {
            script {
                def dockerTool = tool name: 'appone', type: 'org.jenkinsci.plugins.docker.commons.tools.DockerTool'
                dockerTool.build()
            }
        }
    }



        
    stage('Run Container') {
        steps {
            script {
                def dockerTool = tool name: 'appone', type: 'org.jenkinsci.plugins.docker.commons.tools.DockerTool'
                dockerTool.image('nginx:latest').run("-d -p 8010:80 --name appone")
            }
        }
    }
        
        stage('Copy Files to Container') {
            steps {
                // Copy files from the repository to the running container (replace 'your-container-name' with the actual container name)
                script {
                    docker.cp("CAPI/*", "appone:/var/www/html/CAPI/")
                }
            }
        }
    }
}
