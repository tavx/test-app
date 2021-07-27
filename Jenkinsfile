pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo "Running apps"
                sh 'bash *.sh'
            }
        }
        stage('Test #1') {
            steps {
                sh '''
                echo "Test bash script output"
                if [ -f test-variable ]; then
	                echo "Tests passed"
	                exit 0 
                else
	                exit 1
                fi
                '''
            }
        }
        stage('Test #2') {
            steps {
                sh '''
                echo "Test html output"
                if [ `ls *.html` ]; then
	                echo "HTML Tests passed"
	                exit 0 
                else
	                exit 1
                fi
                '''
            }
        }
        stage('Deploy') {
            steps {
                sshagent(credentials : ['tomikiaikido.ru']) {
                    sh '''
                    [ -d ~/.ssh ] || mkdir ~/.ssh && chmod 0700 ~/.ssh
                    ssh-keyscan -p $DEPLOY_PORT -t rsa,dsa $DEPLOY_SERVER >> ~/.ssh/known_hosts
                    scp -P $DEPLOY_PORT -r *.html $DEPLOY_USER@$DEPLOY_SERVER:$DEPLOY_HOME/"
                    '''
                }
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