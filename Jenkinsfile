node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }
    stage('Dockerfile Lint'){
        def lintResult = sh returnStdout: true, script: 'docker run --rm -i lukasmartinelli/hadolint < Dockerfile'
        if (lintResult.trim() == '') {
            println 'Lint finished with no errors'
        } else {
            println 'Error found in Lint'
            println "${lintResult}"
            currentBuild.result = 'UNSTABLE'
        }
    } // end stage
    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("mynodeapp1")
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        app.inside {
            sh 'echo "Tests passed"'
        }
    }
}
