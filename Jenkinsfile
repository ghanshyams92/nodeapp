pipeline {
environment {
registry = "gsaini05/nodeapp"
registryCredential = 'dockerhub_1'
dockerImage = ''}
agent any
stages {
 stage('Cloning Git') {
  steps {
  script {
  git 'https://github.com/ghanshyams92/nodeapp.git'
  }}}
 stage('Dockerfile Lint') {
  steps {
  sh 'sudo docker run --rm -i  hadolint/hadolint < Dockerfile'
 }
}
 stage('Building image') {
  steps{
  script {
  dockerImage = docker.build registry + ":$BUILD_NUMBER"}}}
 stage('Deploy Image') {
  steps{
  script {
  docker.withRegistry( '', registryCredential ) {
  dockerImage.push()
 }}}} 
 stage('Mocha test') {
  steps{
  script {
  sh 'sudo npm test'
  }
 }
} 
 stage('Container Security Scan') {
  steps {
  sh 'echo docker.io/gsaini05/nodeapp:"$BUILD_NUMBER" `pwd`/Dockerfile > anchore_images'
  anchore name: 'anchore_images'}}
 stage('Cleanup') {
  steps {
  sh'''
  for i in `cat anchore_images | awk '{print $1}'`;do docker rmi $i; done
  '''}}}}
