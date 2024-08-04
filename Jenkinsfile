pipeline {
    agent any
    stages {
        stage('Clone') {
            steps {
                // git branch: 'main', url: 'https://github.com/khuongsatou/mtips5s_docker_registry_jenkins.git'
                echo 'hello world'
            }
        }
        stage('Build Docker and Push') {
            steps {
                withDockerRegistry(credentialsId: 'mtips5s_docker', url: 'https://index.docker.io/v1/') {
                    // some block
                    echo 'hello world'
                    // sh 'docker build --platform linux/amd64 -t khuong123/mtips5s_docker_jenkins:dev_1 .'
                    // sh 'docker push khuong123/mtips5s_docker_jenkins:dev_1'
                }
            }
        } 
        stage('SSH Remote to project') {
            steps {
                script {
                    def deploying = "#!/bin/bash\n"+
                    "cd /home/mtips5s\n"+
                    "docker pull khuong123/mtips5s_docker_jenkins:dev_1\n"
                    "docker compose up --remove-orphans --build -d\n"
                    

                    sshagent(credentials: ['mtips5s_ssh_2'], ignoreMissing: true) {
                        // some block
                        // sh '''
                        //     cat > deploy.sh << 'EOF'
                        //     #!/bin/bash
                        //     ssh -o StrictHostKeyChecking=no -l root 45.77.242.223 << 'EOS'
                        //         cd /home/mtips5s
                        //         docker pull khuong123/mtips5s_docker_jenkins:dev_1
                        //         docker compose up --remove-orphans --build -d
                        //     EOS
                        //     EOF
                        //     chmod +x deploy.sh
                        //     ./deploy.sh
                        //     rm deploy.sh
                        // '''
                        sh """
                            ssh -o StrictHostKeyChecking=no -l root 45.77.242.223 "echo \\\"${deploying}\\\" > deploy.sh && chmod +x deploy.sh && ./deploy.sh"
                        """
                    }
                }
               
            }
        }
    }
}