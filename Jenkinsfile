pipeline {
    agent any
    stages {
	stage('Pull Nix') {
	    steps {
		git changelog: false, credentialsId: '329fefc4-6b34-4c35-941a-ba5fd1736773', poll: false, url: 'https://github.com/AaronVerDow/nix'
	    }
	}
	stage('Update') {
	    steps {
		sh '''
		    find
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
