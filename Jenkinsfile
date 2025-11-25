pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'dockerhub-creds' // ID des credentials Jenkins
        IMAGE_NAME = 'votre-utilisateur/student-management'
        IMAGE_TAG = 'latest'
    }

    tools {
        jdk 'JDK17'
        maven 'Maven'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/fedibenman/ci'
            }
        }

        stage('Build with Maven') {
            steps {
                bat 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    bat "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    // Login using Jenkins credentials
                    withCredentials([usernamePassword(credentialsId: "${DOCKERHUB_CREDENTIALS}", 
                                                      usernameVariable: 'DOCKER_USER', 
                                                      passwordVariable: 'DOCKER_PASS')]) {
                        bat 'docker login -u %DOCKER_USER% -p %DOCKER_PASS%'
                        bat "docker push ${IMAGE_NAME}:${IMAGE_TAG}"
                    }
                }
            }
        }
    }

    post {
        success {
            echo "Pipeline terminé avec succès !"
        }
        failure {
            echo "Pipeline échoué."
        }
    }
}
