pipeline {
  agent any

  stages {
    stage('Install Dependencies') {
      steps {
        sh '''
        echo Installing base tools...
        sudo apt-get update -y
        sudo apt-get install -y git curl wget unzip build-essential libssl-dev zlib1g-dev libbz2-dev \
          libreadline-dev libsqlite3-dev libffi-dev

        echo Installing AWS CLI v2...
        curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
        unzip awscliv2.zip
        sudo ./aws/install

        echo Installing Terraform 1.12.2...
        wget https://releases.hashicorp.com/terraform/1.12.2/terraform_1.12.2_linux_amd64.zip
        unzip terraform_1.12.2_linux_amd64.zip
        sudo mv terraform /usr/local/bin/

        echo Installing Python 3.13.5...
        wget https://www.python.org/ftp/python/3.13.5/Python-3.13.5.tgz
        tar xzf Python-3.13.5.tgz
        cd Python-3.13.5
        ./configure --enable-optimizations
        make -j$(nproc)
        sudo make altinstall
        python3.13 --version
        '''
      }
    }
  }
}
