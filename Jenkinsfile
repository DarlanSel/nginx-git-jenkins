pipeline {
  agent any
  stages {
    stage("remove old container") {
      steps {
        sh """
          docker rm my-nginx-cont -f
        """
      }
    }
    stage("remove old image") {
      steps {
        sh """
          docker image rm my-nginx
        """
      }
    }
    stage("build image") {
      steps {
        sh """
          docker build -t my-nginx .
        """
      }
    }
    stage("run") {
      steps {
        sh """
          docker run --name my-nginx-cont -p 8082:80 -d my-nginx
        """
      }
    }
  }
  post {
    always {
      emailext (
        to: 'sdarlanset@gmail.com darlans@alunos.utfpr.edu.br ricardosobjak@utfpr.edu.br',
        body: '${DEFAULT_CONTENT}',
        mimeType: 'text/html',
        subject: '${DEFAULT_SUBJECT}',
        replyTo: '$DEFAULT_REPLYTO'
      )
    }
  }
}
