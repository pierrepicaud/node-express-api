pipeline {
    agent {  any { image 'node:12.16.2' args '-p 3000:3000' } }
    stages {
        stage('build') {
            steps {
                sh 'node --version'
                sh 'node .'
            }
        }
    }
}
