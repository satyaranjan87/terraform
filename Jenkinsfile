pipeline {
    agent {
    kubernetes {
        label "data-provision-${UUID.randomUUID().toString()}"
        yaml """
apiVersion: v1
kind: Pod
metadata:
  labels:
    jenkins: jenkins-pipeline
spec:
    serviceAccountName: ksa
    containers:
    - name: terraform
      image: gcr.io/ansible-318616/terraform:latest 
      imagePullPolicy: Always
      securityContext:
        runAsUser: 0
      command:
        - cat
      tty: true
      resources:
        requests:
          memory: "200Mi"
          cpu: "250m"
        limits:
          memory: "1000Mi"
          cpu: "1000m"       
"""
             }
    }

    stages {
stage('terraform') {
  steps {
    container('terraform') {
     sh '''
     terraform --version
	terraform init
	terraform validate
	terraform plan
	terraform apply -input=false -auto-approve
	 '''
        }
     }
   }
 }
}
