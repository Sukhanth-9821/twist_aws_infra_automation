pipeline{
    agent any

    stages{
        stage ("Terraform init"){
            steps{
                sh ('terraform init -reconfigure')
            }
        }
        stage ("terraform plan"){
            steps{
                echo "Current working directory ${pwd}"
                sh ("terraform plan")
            }
        }
        stage ("Approval Stage"){
            steps{
                input "Is it approved"
            }
        }
        stage ("terraform apply"){
            steps{
                echo "terraform action is ==> ${action}"
                sh ("terraform ${action}")
            }
        }
    }
    post {  
         always {  
             echo 'This will always run'  
         }  
         success {  
            emailext body: 'Check console output at $BUILD_URL to view the results. \n\n ${CHANGES} \n\n -------------------------------------------------- \n${BUILD_LOG, maxLines=100, escapeHtml=false}', 
            to: "sukhansukhanth@gmail.com", 
            subject: 'Build Success in Jenkins: $PROJECT_NAME - #$BUILD_NUMBER'
         }  
         failure {  
            emailext body: 'Check console output at $BUILD_URL to view the results. \n\n ${CHANGES} \n\n -------------------------------------------------- \n${BUILD_LOG, maxLines=100, escapeHtml=false}', 
            to: "sukhansukhanth@gmail.com", 
            subject: 'Build failed in Jenkins: $PROJECT_NAME - #$BUILD_NUMBER'
         }  
         unstable {  
             echo 'This will run only if the run was marked as unstable'  
             mail bcc: '', body: "<b>Example</b><br>Project: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER} <br> URL de build: ${env.BUILD_URL}", cc: '', charset: 'UTF-8', from: '', mimeType: 'text/html', replyTo: '', subject: "Unstable CI: Project name -> ${env.JOB_NAME}", to: "sukhanthwhitehat@gmail.com";  
         }  
         changed {  
             echo 'This will run only if the state of the Pipeline has changed'  
             echo 'For example, if the Pipeline was previously failing but is now successful'  
         }  
     }  
}