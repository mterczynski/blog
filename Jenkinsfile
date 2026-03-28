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
                    npm ci
                    npm run build
					scp -r .vitepress/dist/* ${DESTINATION}
				'''
			}
		}
	}
}
