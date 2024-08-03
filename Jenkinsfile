pipeline {
    agent any
    stages {
        stage('Clone') {
            steps {
                // git branch: 'main', url: 'https://gitlab.com/vankhuong/mtips5s_jenkins.git'
                echo 'hello world'
            }
        }
        stage('Clone') {
            steps {
                // This step should not normally be used in your script. Consult the inline help for details.
                withDockerRegistry(credentialsId: 'mtips5s_gitlab_token_deloy', url: 'https://index.docker.io/v1/') {
                    // some block
                }
            }
        }
    }
}