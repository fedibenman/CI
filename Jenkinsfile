pipeline {
    agent any

    tools {
        jdk 'JDK17'
        maven 'Maven'
    }

    stages {
        stage('GIT') {
            steps {
                git branch 'main'
                url:'https://github.com/fedibenman/ci' 
            }
        }

    stage ('compile stage'){
        steps{
            bat 'mvn clean compile'
        }
    }
   }
    
}
