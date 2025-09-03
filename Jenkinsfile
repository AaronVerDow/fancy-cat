pipeline {
    agent any
    stages {
	stage('Pull Nix') {
	    steps {
		git changelog: false, credentialsId: '329fefc4-6b34-4c35-941a-ba5fd1736773', poll: false, url: 'https://github.com/AaronVerDow/nix', branch: 'main'
	    }
	}
	stage('Update') {
	    steps {
		sh '''
		    pwd
		    cd pkgs/fancy-cat
		    nix-shell -p nurl --run './dirty_update.sh ${env.GIT_COMMIT}'
		    git add .
		    git commit -m "auto update fancy-cat"
		    git status
		'''
	    }
	}
    }
}
