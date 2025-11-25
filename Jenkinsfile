pipeline {
    agent any

    tools {
        jdk 'JDK17'
        maven 'Maven'
    }

    stages {
        stage('GIT') {
            steps {
                // Correct git syntax
                git branch: 'main', url: 'https://github.com/fedibenman/ci'
            }
        }

        stage('Compile') {
            steps {
                // Use 'bat' on Windows or 'sh' on Linux
                bat 'mvn clean compile'
            }
        }
    }
}
