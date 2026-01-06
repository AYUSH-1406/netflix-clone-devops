pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        echo 'Code checked out successfully'
      }
    }

    stage('Docker Build') {
      steps {
        bat '''
          docker build ^
            -f Application-Code/Dockerfile ^
            -t netflix-frontend:ci-test ^
            Application-Code
        '''
      }
    }
  }
}
