pipeline {
    agent any

    stages {

        stage('Debug') {
            steps {
                echo '🚀 Jenkins pipeline is running...'
            }
        }

        stage('Pull Code') {
            steps {
                echo '📥 Pulling code from GitHub...'
                checkout scm
                sh 'ls -la'
            }
        }

        stage('Validate Files') {
            steps {
                sh '''
                    echo "🔍 Checking required files..."

                    test -f index.html || { echo "❌ index.html missing"; exit 1; }
                    test -f style.css  || { echo "❌ style.css missing"; exit 1; }
                    test -f app.js     || { echo "❌ app.js missing"; exit 1; }

                    echo "✅ All required files are present!"
                '''
            }
        }

        stage('Deploy to Nginx') {
            steps {
                sh '''
                    echo "🚀 Deploying to /var/www/my-web-app..."

                    sudo cp index.html /var/www/my-web-app/index.html
                    sudo cp style.css  /var/www/my-web-app/style.css
                    sudo cp app.js     /var/www/my-web-app/app.js

                    sudo systemctl reload nginx

                    echo "✅ Deployment completed successfully!"
                '''
            }
        }
    }

    post {
        success {
            echo '🎉 SUCCESS: Application is live!'
        }
        failure {
            echo '❌ FAILURE: Check pipeline logs!'
        }
    }
}
