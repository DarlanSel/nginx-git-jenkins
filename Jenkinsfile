pipeline {
  agent any
  stages {
    stage("build image") {
      steps {
        sh """
          sudo docker build -t my-nginx .
        """
      }
    }
    stage("remove old container") {
      steps {
        sh """
          sudo docker rm my-nginx-cont -f
        """
      }
    }
    stage("run") {
      steps {
        sh """
          sudo docker run --name my-nginx-cont -p 8082:80 -d my-nginx
        """
      }
    }
  }
}
