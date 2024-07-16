pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
        // TF_VAR_vpc_id         = '' // Zamień na ID swojej VPC
        // TF_VAR_ami_id         = '' // Zamień na ID swojego AMI
        TF_VAR_key_name       = 'ALX-2'       // Zamień na nazwę swojego klucza
        TF_VAR_ssh_user       = 'ubuntu'       // Zamień na odpowiednią nazwę użytkownika
        TF_VAR_private_key_path = '~/.ssh/ALX-2' // Zamień na ścieżkę do swojego klucza prywatnego
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/dev-com2020/app_terraform', branch: 'main'
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
