pipeline {
    agent any
parameters {
  choice(
            choices: ['DEV' , 'PROD'],
            description: '',
            name: 'APPLICATION_ENVIRONMENT')
  string defaultValue: '', description: '', name: 'Server_IP'
}

    stages {
        stage('prerequisite'){
        steps{
           sshagent(['loginkey']) {
		   sh "ssh -o StrictHostKeyChecking=no ec2-user@${params.Server_IP} sudo wget https://raw.githubusercontent.com/virajnemane/nodejenkinsapp/master/prerequisites.sh"
		   sh "ssh -o StrictHostKeyChecking=no ec2-user@${params.Server_IP} sudo sh prerequisites.sh"
                 }
         }
}
        stage ('DEV') {
           when {
                expression { params.APPLICATION_ENVIRONMENT == 'DEV' }
            }
            steps{
            sshagent(['loginkey']) {
            sh "ssh -o StrictHostKeyChecking=no ec2-user@${params.Server_IP} git clone https://github.com/virajnemane/nodejenkinsapp.git"
            sh "ssh -o StrictHostKeyChecking=no ec2-user@${params.Server_IP} sudo /usr/local/bin/docker-compose -f /home/ec2-user/nodejenkinsapp/docker-compose.yml up --build -d"  
             }
		}
	    }
                stage ('PROD') {
           when {
                expression { params.APPLICATION_ENVIRONMENT == 'PROD' }
            }
            steps{
			sshagent(['loginkey']) {
            sh "ssh -o StrictHostKeyChecking=no ec2-user@${params.Server_IP} git clone -b prod https://github.com/virajnemane/nodejenkinsapp.git"
            sh "ssh -o StrictHostKeyChecking=no ec2-user@${params.Server_IP} sudo /usr/local/bin/docker-compose -f /home/ec2-user/nodejenkinsapp/docker-compose.yml up --build -d"  		
	        }
        }			
	    }
	   
}
}
