pipeline {
  agent any

  environment {
    TF_VAR_region       = 'ap-south-2'
    TF_VAR_env          = 'dev'
    TERRAFORM_VERSION   = '1.12.2'
  }

  stages {
    stage('Prepare Environment') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'aws-creds', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
          sh '''
            echo "==> Installing Terraform..."
            terraform -version

            echo "==> Initializing Terraform..."
            cd iac-terraform
            terraform init

            echo "==> Planning Infrastructure..."
            terraform plan -var="region=${TF_VAR_region}" -var="env=${TF_VAR_env}" -out=tfplan

            echo "==> Applying Infrastructure..."
            terraform apply -auto-approve tfplan
          '''
        }
      }
    }
  }
}
