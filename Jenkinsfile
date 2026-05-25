pipeline {
	agent { label 'terraform-node' } // runs on Slave Node
	
	environment {
		IMAGE = "myapp:${BUILD_NUMBER}"
	}
    stages {
		stage ('Checkout')
			steps {
				checkout scm
		}
    }
    stage('Building image') {
      steps{
		  sh 'docker build -t $IMAGE .'
        }
      }
    stage('Unite Test') {
      steps	{
		  sh 'docker run --rm $IMAGE echo "Running tests ....."'
        }
    }
    stage('Deploy Image') {
      steps{
        sh ''' 
          docker rm -f myapp || true 
          docker run -d --name myapp -p 8080:80 $IMAGE 
		'''
          }
        }
    }
		post {
		success { 
			echo "Deployment success"
	}
		failure {
		echo "Deployment failed"
	}
		always {
		sh 'docker system prune -f'
			}
		}		
	
