pipeline {
    agent any

    environment {
        REGISTRY = 'se4458presentation.azurecr.io' // Azure Container Registry adınız
        IMAGE = 'se4458'                           // Docker imaj adınız
        TAG = 'latest'                             // Docker imaj tag'ınız
        CI_NAME = 'se4458'                         // Azure Container Instances adınız
        RESOURCE_GROUP = 'SE4458_Presentation'     // Azure Kaynak Grubunuz
        DNS_NAME_LABEL = 'se4458'                  // Azure Container Instances DNS adı etiketi
        AZURE_CREDENTIALS_ID = 'f8c570ca-17b7-47f7-9cd2-55a9bf96c11d
' // Azure kimlik bilgilerinizin Jenkins'teki ID'si
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t se4458presentation.azurecr.io/se4458:latest. '
                }
            }
        }

        stage('Push to Azure Container Registry') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: AZURE_CREDENTIALS_ID, usernameVariable: 'AZURE_USERNAME', passwordVariable: 'AZURE_PASSWORD')]) {
                        sh 'docker login se4458presentation.azurecr.io -u 20070006072@stu.yasar.edu.tr -p Rzr53abb'
                        sh 'docker push se4458presentation.azurecr.io/se4458:latest'
                    }
                }
            }
        }

        stage('Deploy to Azure Container Instances') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: AZURE_CREDENTIALS_ID, usernameVariable: 'AZURE_USERNAME', passwordVariable: 'AZURE_PASSWORD')]) {
                        sh 'az login --username 20070006072@stu.yasar.edu.tr --password Rzr53abb'
                        sh 'az container create --resource-group se4458_presentation --name se4458 --image se4458presentation/se4458:latest --dns-name-label se4458 --ports 80'
                    }
                }
            }
        }

        stage('Health Check') {
            steps {
                script {
                   "curl http://se4458.euwest.azurecontainer.io"
                }
            }
        }
    }

    post {
        always {
            sh 'echo Pipeline is completed!'
        }
    }
}
