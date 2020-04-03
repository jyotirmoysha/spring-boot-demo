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
	 
}