pipeline {
  /* ------------------------------------------------------------
     Runs on any Ubuntu agent that has sudo privileges available
     ---------------------------------------------------------- */
  agent any            // or:  agent { label 'ubuntu' }

  environment {
    TERRAFORM_VERSION = "1.12.2"
  }

  stages {
    /* -------------------------  Terraform init  ------------------------ */
    stage('Terraform Init') {
      steps {
        dir('iac-terraform') {
          sh '''
          echo "==> Terraform init..."
          terraform version
          terraform init -input=false
          '''
        }
      }
    }

    /* -------------------------  Terraform plan  ------------------------ */
    stage('Terraform Plan') {
      steps {
        dir('iac-terraform') {
          sh '''
          echo "==> Terraform plan..."
          terraform plan -out=tfplan
          '''
        }
      }
    }

    /* -------------------------  Terraform apply  ----------------------- */
    stage('Terraform Apply') {
      steps {
        dir('iac-terraform') {
          sh '''
          echo "==> Terraform apply..."
          terraform apply -auto-approve tfplan
          '''
        }
      }
    }
  }

  /* ---------------------  Archive pipeline artifacts  ------------------ */
  post {
    success {
      /* Store everything produced by the build. Adjust the pattern
         if your workspace is large and you only need .tfstate, logs, etc. */
      archiveArtifacts artifacts: '**/*', fingerprint: true
    }
  }
}
