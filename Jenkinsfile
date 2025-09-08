pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/iamahmed28/portfolio-cicd.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t portfolio-site .'
            }
        }

        stage('Stop Old Container') {
            steps {
                bat '''
                docker ps -q -f name=portfolio-container > tmp.txt
                set /p CID=<tmp.txt
                if not "%CID%"=="" (
                    docker stop portfolio-container
                    docker rm portfolio-container
                ) else (
                    echo "No container to stop or remove"
                )
                del tmp.txt
                '''
            }
        }

        stage('Run New Container') {
            steps {
                bat 'docker run -d -p 8081:80 --name portfolio-container portfolio-site'
            }
        }
    }
}
