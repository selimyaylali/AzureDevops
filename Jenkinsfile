pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t se4458presentation.azurecr.io/se4458:latest .'
                }
            }
        }

        stage('Push to Azure Container Registry') {
            steps {
                script {
                    // Bu kısımda kimlik bilgilerini güvenli bir şekilde saklamak önemlidir
                    sh 'docker login se4458presentation.azurecr.io -u se4458presentation -p dY0lio50M3k62DxjrkRyqJCRc7JarIPJ3nKTiBs2Uk+ACRALJPXM'
                    sh 'docker push se4458presentation.azurecr.io/se4458:latest'
                }
            }
        }

        stage('Deploy to Azure Container Instances') {
            steps {
                script {
                    // Bu kısımda da Azure kimlik bilgilerini güvenli bir şekilde saklamak önemlidir
                    sh 'az login --username 20070006072@stu.yasar.edu.tr --password Rzr53abb'
                    sh 'az container create --resource-group SE4458_Presentation --name se4458 --image se4458presentation.azurecr.io/se4458:latest --dns-name-label se4458 --ports 80'
                }
            }
        }

        stage('Health Check') {
            steps {
                script {
                    sh 'curl http://se4458.europe.azurecontainer.io'
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
