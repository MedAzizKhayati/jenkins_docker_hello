pipeline{
    agent any
    environment{
        DOCKERHUB_CREDENTIALS = credentials('docker_hub_credentials')
    }
    stages{
        stage("Build"){
            steps{
                echo "========BUILDING========"
                sh 'docker build -t medazizkhayati/jenkins_docker_hello:${BUILD_NUMBER} .'
            }
        }
        stage("Test"){
            steps{
                echo "========TESTING========"
                sh 'docker run --name test medazizkhayati/jenkins_docker_hello:${BUILD_NUMBER}'
                sh 'docker rm test'
            }
        }
        stage("Push"){
            steps{
                echo "========PUSHING========"
                withCredentials([usernamePassword(
                    credentialsId: 'docker_hub_credentials',
                    usernameVariable: 'DOCKER_USERNAME', 
                    passwordVariable: 'DOCKER_PASSWORD')
                ]) {
                    sh 'docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}'
                }
                sh 'docker push medazizkhayati/jenkins_docker_hello:${BUILD_NUMBER}'
                sh 'docker rmi medazizkhayati/jenkins_docker_hello:${BUILD_NUMBER}'
            }
        }

    }
}