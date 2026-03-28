pipeline {
	agent any

    environment {
        DESTINATION = "root@mterczynski.pl:/var/www/html/blog"
    }

	options {
		disableConcurrentBuilds()
	}

	stages {
		stage('Build') {
			steps {
				sh 'npm ci'
				sh 'npm run build'
			}
		}
		stage('Deploy') {
			steps {
				sh 'scp -r _site/* ${DESTINATION}'
			}
		}
	}
}
