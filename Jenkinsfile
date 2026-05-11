pipeline {
    agent any

    environment {
        CONTAINER_NAME = "nestjs-app"
        IMAGE_NAME = "nestjs-image"
        EMAIL = "chetansharma98004@gmail.com"
        PORT = "3000"
    }

    stages {
        stage('Clone Repo'){
            steps{
                git branch: 'main', url: 'https://github.com/Ctnsrma/CI-CD-Pipeline-Using-Jenkins-Github-WebHook-Ubuntu-AWS-EC2-Docker-Git.git'
            }
        }
        stage('Build Docker Image'){
            steps{
                sh 'docker build -t $IMAGE_NAME .'
            }
        }
        stage('Stop & Remove Previous Container'){
            steps{
                sh '''
                docker stop $CONTAINER_NAME || true
                docker rm $CONTAINER_NAME || true
                '''
            }
        }
        stage('Docker Container Run'){
            steps{
                sh '''
                docker run -d -p ${PORT}:${PORT} --name $CONTAINER_NAME $IMAGE_NAME
                '''
            }
        }
        stage('Send Email Notification'){
            steps{
                emailext(
                    subject: "App Deployed Successfully on EC2",
                    body: """
                    Your App is Deployed

                    http://56.228.29.97:${PORT}/
                    """,
                    to: "${EMAIL}"
                )
            }
        }
    }
}