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
                    bundle exec jekyll build
					scp -r _site/* ${DESTINATION}
				'''
			}
		}
	}
}
