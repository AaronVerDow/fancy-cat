pipeline {
    agent any
    stages {
	stage('Test') {
	    steps {
		echo "Commit: ${env.GIT_COMMIT}"
		echo "Revision: $SVN_REVISION"
		echo "Commit ID: $GIT_COMMIT"
	    }
	}
    }
}
