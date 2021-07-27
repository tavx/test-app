pipeline {
    agent any
    stages {
        stage('Test') {
            steps {
                echo "Test bash script output"
                if [ -f test-variable ]; then
	                echo "Tests passed"
                    rm test-variable
	                exit 0 
                else
	                exit 1
                fi
            }
        }
        stage('Build') {
            steps {
                echo "Running apps"`
                bash *.sh
            }
        }
    }
    post {
        always {
            echo 'This will always run'
        }
        success {
            echo 'Build and test successful'
        }
        failure {
            echo 'Build failed!'
        }
        unstable {
            echo 'Build not deployed'
        }
        changed {
            echo "Changed"
        }
    }
}