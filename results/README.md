# IAC Challenge

## Infrastructure setup

Generate the SSH key pair:

```
$ mkdir ssh_keys && ssh-keygen -t rsa -b 4096 -f ssh_keys/id_rsa
```

Initialize and deploy the instance:

```
$ terraform init
$ terraform apply
```

This will automatically generate the Ansible inventory file with the IP address of the provisioned machine.

Run the Ansible playbook to install Jenkins:

```
$ ansible-playbook -i hosts jenkins-playbook.yml -v
```

## Jenkins configuration

After the Jenkins installation, JDK and Maven should be enabled in "Manage Jenkins" > "Global Tool Configuration"

  - Java Development Kit
    - Name: JDK
    - JAVA_HOME: `/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.222.b10-0.el7_6.x86_64`

  - Maven
    - Name: M3
    - MAVEN_HOME: `/usr/share/maven`

## Pipeline setup

You can access the Jenkins interface [here](http://167.71.181.131:8080). To build, deploy and test the REST API endpoints, configure the pipeline as follows:

```
node {
  dev mvnHome
  stage('Preparation') {
    git 'https://github.com/devgrid/calculator-service.git'
    mvnHome = tool 'M3'
  }
  stage('Build') {
    sh 'mvn clean package'
  }
  stage('Deploy') {
    sh 'JENKINS_NODE_COOKIE=keepAlive mvn spring-boot:run &'
    sh 'sleep 10'
  }
  stage('Integration Test') {
    git 'https://github.com/devgrid/calculator-service-test.git'
    sh 'mvn clean test'
  }
}
```

At this point the application should respond to the following example call:

```
curl http://167.71.181.131:8200/calculator/multiply?a=8&b=4
```

## Troubleshooting

If you got a `Failed to connect to the host via ssh` error, maybe the instance isn't really
ready yet. Just wait and then try again.
