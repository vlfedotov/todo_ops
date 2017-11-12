node {

    try {
            stage ('Building app') {
                sh 'make test-build'
            }
            stage ('Run postman tests') {
                sh 'make test'
            }

    } finally {
        stage ('Clean up') {
            sh 'make clean'
        }

    }
}
