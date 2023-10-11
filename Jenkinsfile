pipeline{
    agent {
        docker {
            image 'python:3.7-alpine'
        }
    }
    // environment{
    //     DOCKERHUB_CREDENTIALS = credentials('docker_hub_credentials')
    // }
    stages{
        stage("Build"){
            steps{
                echo "========BUILDING========"
                // sh 'docker build -t medazizkhayati/jenkins_docker_hello:${BUILD_NUMBER} .'
            }
        }
        stage("Test"){
            steps{
                echo "========TESTING========"
                sh 'python main.py'
            }
        }
        stage("Push"){
            steps{
                echo "========PUSHING========"
                // sh 'docker login -u ${DOCKERHUB_CREDENTIALS_USR} -p ${DOCKERHUB_CREDENTIALS_PSW}'
                // sh 'docker push medazizkhayati/jenkins_docker_hello:${BUILD_NUMBER}'
            }
        }

    }
}