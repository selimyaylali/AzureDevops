pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://se4458presentation.azurecr.io', 'se4458presentation') {
                        def customImage = docker.build("se4458presentation.azurecr.io/se4458:latest")
                        customImage.push()
                    }
                }
            }
        }

        stage('Deploy to Azure Container Instances') {
            steps {
                script {
                    sh 'az login --username 20070006072@stu.yasar.edu.tr --password Rzr53abb'
                    sh 'az container create --resource-group SE4458_Presentation --name se4458 --image se4458presentation.azurecr.io/se4458:latest --dns-name-label se4458 --ports 80'
                }
            }
        }

        stage('Health Check') {
            steps {
                script {
                    // Ana sayfanın başarılı bir şekilde yüklendiğini kontrol et
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
