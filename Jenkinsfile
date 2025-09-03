pipeline {
    agent any
    stages {
	stage('Checkout Nix Repo') {
	    steps {
		//dir('nix') {
		    //git credentialsId: '329fefc4-6b34-4c35-941a-ba5fd1736773', poll: false, url: 'https://github.com/AaronVerDow/nix'
		//}
		sh 'ls -al'
	    }
	}
	stage('Test') {
	    steps {
		sh 'ls -al .. '
	    }
	}
    }
}
