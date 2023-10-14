pipeline{
    agent any
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
                sh 'docker push medazizkhayati/jenkins_docker_hello:${BUILD_NUMBER}'
                sh 'docker rmi medazizkhayati/jenkins_docker_hello:${BUILD_NUMBER}'
            }
        }

    }
}