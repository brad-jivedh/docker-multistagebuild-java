pipeline {
agent { label "k8s_node"}
environment {
        IMAGE_TAG="${BUILD_NUMBER}"
    }
  stages {
    stage ("Checkout stage") {
      steps {
        git branch: 'main' , url: 'https://github.com/brad-jivedh/docker-multistagebuild-java.git'
      }
    }
stage ("Builiding Docker Image") {
  steps {
    script {
      echo "Building the docker image"
      sh 'sudo docker build -t jivedh2019/assign:IMAGE_TAG .'
    }
  }
}
stage("Pushing the image to DockerHub") {
            environment {
                DOCKER_CREDENTIALS=credentials('docker_hub')
            }
            steps {
                script {
                  sh 'docker login -u ${DOCKER_CREDENTIALS_USR} -p ${DOCKER_CREDENTIALS_PSW}'
                  sh 'docker push jivedh2019/assign:IMAGE_TAG'
}
}
}
stage("Deploying in k8s cluster") {
  steps {
     sh 'microk8s kubectl apply -f deploy.yml
     sh 'microk8s kubectl apply -f nodeport.yml'
  }
}
}
}
