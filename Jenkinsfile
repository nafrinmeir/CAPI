pipeline {
    agent any
    
    stages {
        stage('Clone') {
            steps {
                // Clone the repository
                git 'https://github.com/nafrinmeir/CAPI.git'
            }
        }
        
        stage('Copy Files') {
            steps {
                // Copy files to Nginx's /var/www/html/ directory
                sh 'cp -r CAPI/* /var/www/html/'
            }
        }
    }
}
