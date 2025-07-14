pipeline {
  /* ------------------------------------------------------------
     Runs on any Ubuntu agent that has sudo privileges available
     ---------------------------------------------------------- */
  agent any            // or:  agent { label 'ubuntu' }

  environment {
    TERRAFORM_VERSION = "1.12.2"
  }

  stages {

    /* -------------------------  Install tools  ------------------------- */
    stage('Install Base Tools') {
      steps {
        sh '''
        set -e   # Exit immediately on errors

        echo "==> Updating apt package index..."
        #sudo apt-get update -y

        echo "==> Installing base packages (git, curl, wget, unzip)..."
        // sudo apt-get install -y git curl wget unzip

        echo "==> Installing AWS CLI v2..."
        // curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
        // unzip -o awscliv2.zip
        // sudo ./aws/install --update            # --update avoids “pre‑existing installation” errors
        aws --version

        echo "==> Installing Terraform ${TERRAFORM_VERSION}..."
        // wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
        // unzip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip
        // sudo mv terraform /usr/local/bin/
        terraform -version
        '''
      }
    }

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
