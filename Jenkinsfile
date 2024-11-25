pipeline {
	agent any
	environment {
		GIT_REPOSITORY_URL = 'https://github.com/M2113/docker_jenkins_demo.git'
		DOCKER_IMAGE_NAME = 'mustufakhan12/docker_jenkins_demo'
		IMAGE_TAG = '1.0'
	}

	stages {
		stage('Clone Repository') {
			steps {
				script {
					try {
						git branch: 'main' , url: GIT_REPOSITORY_URL
					} catch (Exception e) {
						echo "Failed to clone repository: ${e.message}"
						error "Failed to clone repository"
					}
				}
			}
		}

		stage ('BUILD DOCKER IMAGE') {
			steps {
				script {
					try {
						docker.build ("${DOCKER_IMAGE_NAME}: ${IMAGE_TAG}")
					}catch (Exception e) {
						echo "Failed to build Docker image: ${e.message}"
						echo "Failed to build Docker image"
					}
				}
			}
		}

		stage ('Push to DockerHub') {
			steps {
				script {
					try {
						withCredentials([usernamePassword(credentialsId: "mustufa12" , usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
						sh """
							echo "$DOCKER_PASSWORD" | docker login -u  "$DOCKER_USERNAME" --password-stdin		
							docker push ${DOCKER_IMAGE_NAME}:${IMAGE_TAG}
						"""
						}
					} catch (Exception e) {
						echo "Failed to push DOCKER image to registry: ${e.message}"
						echo "Failed to push Docker image"
					}
				}
			}
		}
	}
}

	post {
		success {
			echo 'Build and deployment completed successfully.'
		} 
		failure {
			echo 'Build or deployment failed.'
		}
	}
