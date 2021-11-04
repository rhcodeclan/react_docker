pipeline {
    agent any

    stages {
//        stage('Build') {
//            steps {
//                // Get some code from a GitHub repository
//                git 'https://github.com/rhcodeclan/react_docker.git'
//
//                // Build docker image and run tests.
//                sh '''chmod +x ./.build_image.sh && \\
//                        chmod +x ./.run_tests.sh && \\
//                        ./.build_image.sh && \\
//                        ./.run_tests.sh'''
//            }
//        }
        stage('Configure AWS') {
            environment {
                AWS = credentials("AWS_KEY")
                AWS_ACCESS_KEY_ID = "$AWS_USR"
                AWS_SECRET_ACCESS_KEY = "$AWS_PWD"
                AWS_DEFAULT_REGION = 'eu-west-2'
            }
            steps {
                withCredentials([usernamePassword(credentialsId: 'AWS_KEY', passwordVariable: 'AWS_PASS', usernameVariable: 'AWS_USER')]) {
                    sh '''
                        printf "16\n$AWS_USER\n$AWS_PASS\n" | eb init
                        printf '16\n$AWS_USER\n$AWS_PASS\n' | aws configure --profile eb_cli
                    '''
                }
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
