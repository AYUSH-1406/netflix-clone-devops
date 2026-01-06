pipeline {
    agent any

    environment {
        AWS_REGION = "ap-south-1"
        ECR_REPO = "203071037199.dkr.ecr.ap-south-1.amazonaws.com/netflix-frontend"
        IMAGE_TAG = "${BUILD_NUMBER}"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Docker Build') {
            steps {
                sh '''
                  docker build -t netflix-frontend:${IMAGE_TAG} .
                '''
            }
        }

        stage('Login to ECR') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding',
                                  credentialsId: 'aws-creds']]) {
                    sh '''
                      aws ecr get-login-password --region $AWS_REGION \
                      | docker login --username AWS --password-stdin $ECR_REPO
                    '''
                }
            }
        }

        stage('Tag Image') {
            steps {
                sh '''
                  docker tag netflix-frontend:${IMAGE_TAG} $ECR_REPO:${IMAGE_TAG}
                  docker tag netflix-frontend:${IMAGE_TAG} $ECR_REPO:latest
                '''
            }
        }

        stage('Push to ECR') {
            steps {
                sh '''
                  docker push $ECR_REPO:${IMAGE_TAG}
                  docker push $ECR_REPO:latest
                '''
            }
        }
    }

    post {
        success {
            echo "✅ Image pushed successfully to ECR"
        }
        failure {
            echo "❌ Pipeline failed"
        }
    }
}
