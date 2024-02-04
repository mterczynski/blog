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
                    rm -rf blog
                    mv _site blog
                    ssh root@mterczynski.pl
                    rm -rf /var/www/html/blog 
                    exit
					scp -r blog ${DESTINATION}
				'''
			}
		}
	}
}
