pipeline {
	agent any

    environment {
        DESTINATION = "root@mterczynski.pl:/var/www/html/blog"
    }

	options {
		disableConcurrentBuilds()
	}

	stages {
		stage('Deploy') {
			steps {
				sh '''
                    npm install
                    npm run build
					scp -r dist/* ${DESTINATION}
				'''
			}
		}
	}
}
