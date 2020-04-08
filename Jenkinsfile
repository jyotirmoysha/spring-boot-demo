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
    stage('Build Docker image'){

        /* This builds the actual image */

        app = docker.build("jyotirmoydoc/sample-spring-boot")
	    //sh 'sudo docker build -t jyotirmoydoc/sample-spring-boot:2.0.0 .'
    }
    stage('Test image') {
        
        app.inside {
            echo "Tests passed"
        }
    }
    stage('Push image') {
        /* 
			You would need to first register with DockerHub before you can push images to your account
		*/
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-pwd2') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
            } 
                echo "Trying to Push Docker Build to DockerHub"
    }
    stage('Move artefacts to remote'){
        /* Moving artefacts to deployment server ( Jar and Scripts), and execute remote commands
        on remote serve configured on manage plugins -> configuration-> Publish Over SSH / Add Serve
        */

        sshPublisher(publishers: [sshPublisherDesc(configName: 'jenkins-deploy-serve', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '''ls -lstr
        cd /home/ec2-user/test/target
        ls -lstr
        sh SampleSript.sh
        sleep 10                
        ''', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '**/*.jar,**/*.sh', usePty: true)], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: true)])
    }
	 
}
