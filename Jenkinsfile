pipeline {
    agent any
    tools{
        maven 'Maven'
    }

    stages {
        stage('MAVEN-TEST') {
            steps {
                sh 'mvn test'
                echo 'Maven Testing !!'
            }
        }
        stage('MAVEN-BUILD') {
            steps {
                sh 'mvn package'
                echo 'Maven Building'
            }
        }
        stage('DEPLOY-ON-TEST') {
            steps {
                deploy adapters: [tomcat9(credentialsId: 'tomcat9-cred', path: '', url: 'http://3.87.126.181:8080/')], contextPath: '/app2', war: '**/*.war'
                echo 'Maven Deploy On Test'
            }
        }
        stage("DEPLOY-ON-PROD"){
             input {
                message "Should we continue?"
                ok "Yes we Should"
            }
            
            steps{
                deploy adapters: [tomcat9(credentialsId: 'tomcat9-cred', path: '', url: 'http://3.87.126.181:8080/')], contextPath: '/app3', war: '**/*.war'
            }
        }
    }
    post{
        always{
            echo "============= ALWAYS =============="
        }
        success{
            echo "Pipeline Executed Succesfully !!"
        }
        failure{
            echo "Pipeline Failed Something Went Wrong !!"
        }
    }
}
