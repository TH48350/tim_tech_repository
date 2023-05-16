pipeline {
  agent any
  stages {
    stage ('Build') {
      steps {
        sh 'printenv'
        sh 'docker build -t tim_tech_repository .'
       }
      }
     stage ('Publish ECR') {
      steps {
        withEnv (["AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID}", "AWS_SECRET_ACCESS_KEY=${env.AWS_SECRET_ACCESS_KEY}", "AWS_DEFAULT_REGION=${env.AWS_DEFAULT_REGION}"]) {
          sh 'docker login -u AWS -p $(aws ecr get-login-password --region eu-west-1) 390665570631.dkr.ecr.eu-west-1.amazonaws.com'
          sh 'docker build -t tim_tech_repository .'
          sh 'docker tag tim_tech_repository:latest 390665570631.dkr.ecr.eu-west-1.amazonaws.com/tim_tech_repository:""$BUILD_ID""'
          sh ' docker push 390665570631.dkr.ecr.eu-west-1.amazonaws.com/tim_tech_repository:""$BUILD_ID""'
         }
        }
       }
      }
     }
