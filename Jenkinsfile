pipeline {
    agent any
    environment {
        AWS_DEFAULT_REGION = 'ap-southeast-1'
    }
    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }
        stage('Terraform Init') {
            steps {
                script {
                    bat 'terraform init'
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                script {
                    bat 'terraform plan -out=tfplan'
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                script {
                    bat 'terraform apply -auto-approve tfplan'
                }
            }
        }
        stage('Upload State to S3') {
            steps {
                script {
                    bat 'aws s3 cp terraform.tfstate s3://s3-projo-alpha'
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
