pipeline{
    agent any
    stages{
        stage("cloning github repo"){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/danish573/Terraform_Automation.git']])
            }
        }
        stage("terraform init"){
            steps{
                sh ("terraform init -reconfigure")
            }
        }
        stage("terraform plan"){
            steps{
                sh ("terraform plan")
            }
        }
        stage("action"){
            steps{
                echo "Terraform action is --> ${action}"
                sh('terraform ${action} --auto-approve')
            }
        }
    }
}
