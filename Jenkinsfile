node {
    try {
        stage ('Building app') {
            sh 'make test-build'
        }
        stage ('Run tests') {
            sh 'make test'
        }
    } finally {
        stage ('Clean up') {
            sh 'make clean'
        }
    }
}
