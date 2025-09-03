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
		    nix-shell -p nurl jq --run './dirty_update.sh $GIT_COMMIT'
		    '''
	    }
	}
	stage('Test') {
	    steps {
		sh '''
		    cd pkgs/fancy-cat
		    nix build
		'''
	    }
	}
	stage('Commit') {
	    steps {
		sh '''
		    cd pkgs/fancy-cat
		    git status
		    git config --local user.email "jenkins@verdow.lan"
		    git config --local user.name "Jenkins"
		    git add .
		    git commit -m "auto update fancy-cat"
		    git status
		'''
	    }
	}
	stage('Push') {
	    steps {
		sshagent(['329fefc4-6b34-4c35-941a-ba5fd1736773']) {
		    sh '''
			git status
			git push origin master
		    '''
		}
	    }
	}
    }
}
