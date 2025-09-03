pipeline {
    agent any
    stages {
	stage('Checkout Nix Repo') {
	    steps {
		// git url: 'git@github.com:AaronVerDow/nix.git', branch: 'main'
		// credentialsId: '329fefc4-6b34-4c35-941a-ba5fd1736773'
		sh 'echo steps test'
	    }
	}
	stage('Test') {
	    steps {
		sh 'ls -l nix'
	    }
	}
    }
}
