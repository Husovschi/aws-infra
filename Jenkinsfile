pipeline {
    agent any

    parameters {
        choice(name: 'Command', choices: ['plan', 'apply', 'destroy'], description: '')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Plan') {
            steps {
                script {
                    withCredentials([[$class: 'VaultUsernamePasswordCredentialBinding', credentialsId: 'vault-aws', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID']]) {
                        sh 'terraform init'
                        sh 'terraform plan'
                    }
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
                withCredentials([[$class: 'VaultUsernamePasswordCredentialBinding', credentialsId: 'vault-aws', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID']]) {
                    sh 'terraform ' + params.Command + ' -auto-approve'
                }
            }
        }
    }
}
