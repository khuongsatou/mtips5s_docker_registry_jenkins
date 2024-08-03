pipeline {
    agent any
    stages {
        stage('Clone') {
            steps {
                // git branch: 'main', url: 'https://gitlab.com/vankhuong/mtips5s_jenkins.git'
                // echo 'hello world'
                git branch: 'main', url: 'https://github.com/khuongsatou/mtips5s_docker_registry_jenkins.git'
            }
        }
        stage('Build Docker and Push') {
            steps {
                // This step should not normally be used in your script. Consult the inline help for details.
                // withDockerRegistry(credentialsId: 'mtips5s_docker_jenkins_new', url: 'https://index.docker.io/v1/') {
                //     // some block
                //     sh 'docker build --platform linux/amd64 -t khuong123/mtips5s_docker_jenkins:dev_1 .'
                //     sh 'docker push khuong123/mtips5s_docker_jenkins:dev_1'
                // }
                withDockerRegistry(credentialsId: 'mtips5s_docker', url: 'https://index.docker.io/v1/') {
                    // some block
                    echo 'hello world'
                    sh 'docker build --platform linux/amd64 -t khuong123/mtips5s_docker_jenkins:dev_1 .'
                    sh 'docker push khuong123/mtips5s_docker_jenkins:dev_1'
                }
            }
        }
    }
}