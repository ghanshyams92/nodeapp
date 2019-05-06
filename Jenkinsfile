pipeline {
environment {
registry = "gsaini05/nodeapp"
registryCredential = 'dockerhub_1'
dockerImage = ''}
agent any
stages {
stage('Cloning Git') {
 steps {
 git 'https://github.com/ghanshyams92/nodeapp.git'
 }}
stage('Building image') {
 steps{
 script {
 dockerImage = docker.build registry + ":$BUILD_NUMBER"}}}
 stage('Push image') {
     docker.withRegistry('https://registry.hub.docker.com', 'dockerhub_1') {
         app.push("${env.BUILD_NUMBER}")
         app.push("latest")
     }}
stage('Container Security Scan') {
 steps {
 sh 'echo docker.io/gsaini05/nodeapp:BUILD_NUMBER `pwd`/Dockerfile > anchore_images'
 anchore name: 'anchore_images'}}
stage('Deploy Image') {
 steps{
 script {
 docker.withRegistry( '', registryCredential ) {
 dockerImage.push()
 }}}}
 stage('Cleanup') {
 steps {
 sh'''
 for i in `cat anchore_images | awk '{print $1}'`;do docker rmi $i; done
 '''}}}}
