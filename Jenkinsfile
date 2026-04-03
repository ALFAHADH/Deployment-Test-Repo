pipeline {
    agent any

    stages {

        stage('Pull Code from GitHub') {
            steps {
                echo 'Pulling code from GitHub...'
                checkout scm
                sh 'ls -la'
                echo 'Code pulled successfully!'
            }
        }

        stage('Build Application') {
            steps {
                echo 'Validating application files...'
                sh '''
                    test -f index.html && echo "index.html found OK" || exit 1
                    test -f style.css  && echo "style.css found OK"  || exit 1
                    test -f app.js     && echo "app.js found OK"     || exit 1
                    echo "Build validation complete!"
                '''
            }
        }

        stage('Deploy to Server') {
            steps {
                echo 'Deploying to Nginx...'
                sh '''
                    sudo cp index.html /var/www/html/index.html
                    sudo cp style.css  /var/www/html/style.css
                    sudo cp app.js     /var/www/html/app.js
                    sudo systemctl reload nginx
                    echo "Deployment complete!"
                '''
            }
        }
    }

    post {
        success { echo 'Pipeline SUCCESS - App is live!' }
        failure  { echo 'Pipeline FAILED - Check logs!' }
    }
}
