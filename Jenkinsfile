node {

    echo sh(returnStdout: true, script: 'env')
    BRANCH = env.CHANGE_BRANCH ? env.CHANGE_BRANCH : env.BRANCH_NAME

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
