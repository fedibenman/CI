pipeline {
    agent any

    tools {
        maven 'Maven'        // Name configured in Jenkins -> Global Tool Configuration
        jdk 'JDK17'           // Same for JDK
    }

    stages {


        stage('Build') {
            steps {
                echo "Building Spring Boot app..."
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Run Tests') {
            steps {
                echo "Running tests..."
                sh 'mvn test'
            }
            post {
                always {
                    junit '**/target/surefire-reports/*.xml'
                }
            }
        }


        stage('Deploy') {
            when {
                branch 'main'
            }
            steps {
                echo "Deploying Spring Boot app to server..."
            }
        }
    }

    post {
        success {
            echo "SUCCESS: Spring Boot pipeline completed"
        }
        failure {
            echo "FAILURE: Pipeline failed"
        }
    }
}
