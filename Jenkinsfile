pipeline {
    agent any

    stages {
        stage('Debug') {
            steps {
                echo 'Jenkins pipeline is running...'
            }
        }

        stage('Pull Code') {
            steps {
                echo 'Pulling code...'
                checkout scm
                sh 'ls -la'
            }
        }

        stage('Build') {
            steps {
                sh '''
                    echo "Checking files..."
                    ls
                '''
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    echo "Deploy step running..."
                '''
            }
        }
    }
}
