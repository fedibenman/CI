pipeline {
    agent any

    tools {
        jdk 'JDK17'
        maven 'Maven'
    }

    stages {
        stage('Build') {
            steps {
                echo "Building Spring Boot app..."
                bat 'mvn clean package -DskipTests'
            }
        }

        stage('Run Tests') {
            steps {
                bat 'mvn test'
            }
        }

        stage('Deploy') {
            steps {
                echo "Starting Spring Boot application..."
                bat 'java -jar target/*.jar'
            }
        }
    }

    post {
        failure {
            echo "FAILURE: Pipeline failed"
        }
    }
}
