pipeline {
    agent {
        node {
            label "built-in"
            customWorkspace '/mnt/application'
        }
    }
    
    stages {
        stage ('build') {
            steps {
                sh "cd /mnt/application/"
                sh "mvn install"
            }
        }
        stage ('copy') {
            steps {
                sh "cp WebApp.war /mnt/apache-tomcat-9.0.65/webapps/"
            }
        }
    }
}
