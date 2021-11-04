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

            failure {
                // If Maven was able to run the tests, even if some of the test
                // failed, record the test results and archive the jar file.
                success {
                    echo "Success"
                }
                failed {
                    echo "failed"
                }
            }
        }
    }
}
