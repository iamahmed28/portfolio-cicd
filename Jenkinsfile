pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/iamahmed28/portfolio-cicd.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t portfolio-site .'
            }
        }

        stage('Stop Old Container') {
            steps {
                bat 'docker stop portfolio-container || exit 0'
                bat 'docker rm portfolio-container || true'
            }
        }

        stage('Run New Container') {
    steps {
        bat 'docker run -d -p 8081:80 --name portfolio-container portfolio-site'
    }
}

    }
}
