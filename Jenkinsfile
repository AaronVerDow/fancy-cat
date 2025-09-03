pipeline {
    agent any
    stages {
	stage('Test') {
	    steps {
		sh '''
		    cd nix/pkgs/fancy-cat
		    ./dirty_update.sh ${env.GIT_COMMIT}
		    git add .
		    git commit -m "auto update fancy-cat"
		    git status
		'''
	    }
	}
    }
}
