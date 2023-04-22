# Project 1: Jenkins and Docker 

## Project Description

The ain of the project is to package an application and create a docker image, and publish that on dockerhub.
We want Jenkins to communicate with docker, without using any Jenkins docker plugins. 

In this simple project, we will create a jenkins pipeline "portion" that will perform the following steps:

* Clone code from github repository
* Package a deployable war file( We will omit the 4 other steps before package step)
* Create a Tomcat based image with the packaged war file
* Push the image to your dockerhub repo

## Pre-requisites
For this project, you need to have both Jenkins and docker installed on the same VM. So

### Install jenkins

NB: For convenience, you want to do these steps as root ( note that workign as root is generaly a very bad idea)

* Create a new AWS t2-micro VM
* Install Jenkins ( see the jenkins install notes)
* Install Java and Maven ( see install notes)
* Configure Jenkins, setting the JDK and MAVEN build tools (see notes)
* Test that jenkins is working by trying out a compile job
**  New Freestyle job
**  Git job, URL : https://github.com/sirokode/DevOpsClassCodes 
**  Test job via a manual "Build Now" step

### Install Docker

* Follow docker install instructions and install docker
* Verify that docker is up and running via command `docker ps`

### Permit Jenkins to run docker

We will need to have Jenkins issue  docker commands, so we need to enable jenkins to be able to execute docker commands.

* Check whether the jenkins user can execute docker. To do so
** switch user to jenkins via `sudo su - jenkins`
** then check docker commandness: `docker ps`

You should see an error. If you do not see an error,  it means jenkins can execute docker. Just exit user jenkins by command `exit` or `logout`
That should take you back to root.

If you see an error, give jenkins power/permission to execute docker using these three commands:
*  `sudo usermod -aG docker jenkins`
*  `echo -e 'jenkins ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/jenkins`
*  `service jenkins restart`
*  Now, Test if jenkins can now execute docker commands as described above, ie via doing sudo su - jenkins and then doing ` docker ps`. Once you are satisfied it can, exit by `exit`
*  You should be back to root

### Create working directory

We need a directory to work from, so let us create /opt/deploy, and give it to jenkins

* create dir, `mkdir /opt/deploy`
* give it to jenkins: `chown jenkins:jenkins /opt/deploy

That's it, now you are ready to connect jenkins with docker!

## Package War File
* Create package job, named "package war" from github repo : https://github.com/sirokode/DevOpsClassCodes
* Add a second job, called "dockerit" to depend on the previous "package war" job
* This second job is a simple shell job. Give it the shell commands to execute. Please see the shell commands to be executed in "jenkins-docker.sh" file
* Test that the image is posted to your dockerhub account by runnign the package job
