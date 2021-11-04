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
        stage('Configure AWS') {
            environment {
                AWS_ACCESS_KEY_ID = credentials('AWS_KEY')
            }
            steps {
                sh "printf '$AWS_ACCESS_KEY_ID_USR\n$AWS_ACCESS_KEY_ID_PSW\n' | aws configure --profile eb_cli"
            }
        }
        stage('Publish') {
            steps {
                sh "eb init -r 16 "
                sh "zip zip *"
            }
        }
    }
}
