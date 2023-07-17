pipeline {
    agent any
    
    stages {
        stage('Clone') {
            steps {
                // Clone the repository
                git 'https://github.com/nafrinmeir/CAPI.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                // Build your Docker image (replace 'your-image-name' with the actual image name)
                script {
                    docker.build(nginx:latest)
                }
            }
        }
        
        stage('Run Container') {
            steps {
                // Run the Docker container (replace 'your-image-name' and 'your-container-name' with the actual names)
                script {
                    docker.image(nginx:latest).run("-d -p 80:80 --name appone")
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
