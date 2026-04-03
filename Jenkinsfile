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
                echo 'Building application...'
                sh '''
                    test -f index.html && echo "index.html ✅" || exit 1
                    test -f style.css  && echo "style.css ✅"  || exit 1
                    test -f app.js     && echo "app.js ✅"     || exit 1
                    echo "Build complete!"
                '''
            }
        }

        stage('Deploy to Server') {
            steps {
                echo 'Deploying to web server...'
                sh '''
                    sudo cp -r ./* /var/www/html/
                    sudo rm -f /var/www/html/Jenkinsfile
                    sudo systemctl reload nginx
                    echo "Deployed! ✅"
                '''
            }
        }
    }

    post {
        success { echo '✅ Pipeline SUCCESS - App is live!' }
        failure  { echo '❌ Pipeline FAILED - Check logs!' }
    }
}
