pipeline {
    agent any
    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/khuongsatou/mtips5s_docker_registry_jenkins.git'
            }
        }
        stage('Build Docker and Push') {
            steps {
                withDockerRegistry(credentialsId: 'mtips5s_docker', url: 'https://index.docker.io/v1/') {
                    // some block
                    echo 'hello world'
                    sh 'docker build --platform linux/amd64 -t khuong123/mtips5s_docker_jenkins:dev_1 .'
                    sh 'docker push khuong123/mtips5s_docker_jenkins:dev_1'
                }
            }
        } 
        stage('SSH Remote to project') {
            steps {
                sshagent(['mtips5s_ssh_2']) {
                    // some block
                    sh 'ssh -o StrictHostKeyChecking=no -l root 45.77.242.223 touch test.txt'
                }
            }
        }
    }
}