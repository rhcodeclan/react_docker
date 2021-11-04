pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/rhcodeclan/react_docker.git'

                // Build docker image and run tests.
                sh '''chmod +x ./.build_image.sh && \\
                        chmod +x ./.run_tests.sh && \\
                        ./.build_image.sh && \\
                        ./.run_tests.sh'''
            }
        }
        stage('Publish') {
            steps {
                echo "hoi"
            }
        }
    }
}
