node{
    def app
	
    stage('SCM Checkout'){
        //git 'https://github.com/javahometech/my-app'
        git 'https://github.com/jyotirmoysha/spring-boot-demo.git'
    }
    stage('MVN Package'){

        def mvnHome = tool name: 'Maven', type: 'maven'
		def mvnCMD = "${mvnHome}/bin/mvn"
		
        sh "${mvnCMD} clean package"
    }
    stage('copy file to remote server'){
		//sh 'sudo docker build -t jyotirmoydoc/testrepo:2.0.0 .'
		
		sh "ssh -i /home/ec2-user/AWSKeyPairForDev ec2-user@172.31.21.119"
        sh "touch testDevOps"
        sh "ls -lstr"
	}
	 
}