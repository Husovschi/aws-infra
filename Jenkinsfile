pipeline {
    agent any

    parameters {
        choice(name: 'Command', choices: ['plan', 'apply', 'destroy'], description: '')
    }

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {
        stage('Plan') {
            steps {
                script {
                    sh 'terraform init'
                    sh 'terraform plan'
                }
            }
        }
        stage('Approval') {
            when {
                not {
                    equals expected: 'plan', actual: params.Command
                }
            }
            steps {
                script {
                    input message: 'Do you want to apply the plan?'
                }
            }
        }
        stage('Run command') {
            when {
                not {
                    equals expected: 'plan', actual: params.Command
                }
            }
            steps {
                sh 'terraform ' + params.Command
            }
        }
    }
}