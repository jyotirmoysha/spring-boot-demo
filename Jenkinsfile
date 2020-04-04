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

		sh "cd /home/ec2-user"
		sh "ssh -i /home/ec2-user/AWSKeyPairForDev ec2-user@172.31.21.119"
        sh "touch testDevOps"
        sh "ls -lstr"
        sh "cp SampleSript.sh target/"
    
    }
    stage('Move artefacts to remote'){

        sshPublisher(publishers: [sshPublisherDesc(configName: 'jenkins-deploy-serve', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '''ls -lstr
        cd /home/ec2-user/test/target
        ls -lstr
        sh SampleSript.sh
        java -jar /home/ec2-user/test/target/com.spring-boot.demo-0.0.1-SNAPSHOT.jar
        sh SampleSript.sh
        ''', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '**/*.jar,**/*.sh')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: true)])
    }
	 
}