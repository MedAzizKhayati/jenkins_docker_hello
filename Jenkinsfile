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
                docker.build("medazizkhayati/jenkins_docker_hello${BUILD_NUMBER}")
            }
        }
        stage("Test"){
            steps{
                echo "========TESTING========"
                sh 'python3 main.py'
            }
        }
        stage("Login & Push to DockerHub"){
            steps{
                echo "========LOGIN TO DOCKERHUB========"
                withDockerRegistry([credentialsId: "docker_hub_credentials", url: "https://index.docker.io/v1/"]){
                    echo "========PUSHING TO DOCKERHUB========"
                    docker.withRegistry( '', "${DOCKERHUB_CREDENTIALS}"){
                        docker.image("medazizkhayati/jenkins_docker_hello${BUILD_NUMBER}").push()
                    }
                }
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