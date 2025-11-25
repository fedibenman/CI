pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'dockerhub-creds'  // Docker Hub credentials ID
        IMAGE_NAME = 'fedibenman/firstrepo'
        IMAGE_TAG = 'latest'
    }

    tools {
        jdk 'JDK17'
        maven 'Maven'
        git 'Default' // make sure a Git tool is installed in Jenkins
    }

 stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/fedibenman/ci',
                    credentialsId: 'SpringBoot_2'
            }
        }

stage('Maven Build') {
    steps {
        script {
            def mvnHome = tool 'Maven'
            sh "${mvnHome}/bin/mvn clean package -DskipTests"
        }
    }
}

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: "${DOCKERHUB_CREDENTIALS}",
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh 'echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin'
                    sh "docker push ${IMAGE_NAME}:${IMAGE_TAG}"
                }
            }
        }
    }

    post {
        success { echo "Pipeline terminé avec succès !" }
        failure { echo "Pipeline échoué." }
    }
}
