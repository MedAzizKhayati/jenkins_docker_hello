pipeline{
    agent any
    environment{
        DOCKERHUB_CREDENTIALS = credentials('docker_hub_credentials')
    }
    stages{
        stage("SCM Checkout"){
            steps{
                echo "========SCM CHECKOUT========"
                git 'https://github.com/MedAzizKhayati/jenkins_docker_hello'
            }
        }
        stage("Build"){
            steps{
                echo "========BUILDING========"
                sh 'docker build -t medazizkhayati/jenkins_docker_hello:${BUILD_NUMBER} .'
            }
        }
        stage("Test"){
            steps{
                echo "========TESTING========"
                sh 'python3 main.py'
            }
        }
        stage("Login to DockerHub"){
            steps{
                echo "========LOGIN TO DOCKERHUB========"
                sh 'echo ${DOCKERHUB_CREDENTIALS_PSW} | docker login -u ${DOCKERHUB_CREDENTIALS_USR} --password-stdin'
            }
        }
        stage("Push to DockerHub"){
            steps{
                echo "========PUSHING TO DOCKERHUB========"
                sh 'docker push medazizkhayati/jenkins_docker_hello:${BUILD_NUMBER}'
            }
        }

    }
    post{
        always{
            echo "========always========"
        }
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}