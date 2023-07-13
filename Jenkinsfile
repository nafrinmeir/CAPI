pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                // You can add build steps here, such as compiling your code
                // or building container images
            }
        }

        stage('Deploy') {
            steps {
                // Delete the existing Nginx pod if it exists
                sh 'kubectl delete pod nginx-pod --ignore-not-found=true -n mycrypto'

                // Deploy the Nginx pod with the persistent volume in the "mycrypto" namespace
                sh 'kubectl apply -f /home/master/devops/CAPI/CryptoApi-main/application-file.yaml -n mycrypto'
            }
        }
    }

    post {
        always {
            // Clean up any remaining resources after the pipeline
            // sh 'kubectl delete pod nginx-pod --ignore-not-found=true -n mycrypto'
        }
    }
}
