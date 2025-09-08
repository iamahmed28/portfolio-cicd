pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/<username>/<repo-name>.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t portfolio-site .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh 'docker stop portfolio-container || true'
                sh 'docker rm portfolio-container || true'
            }
        }

        stage('Run New Container') {
            steps {
                sh 'docker run -d -p 8081:80 --name portfolio-container portfolio-site'
            }
        }
    }
}
