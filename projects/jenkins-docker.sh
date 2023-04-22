cd /opt/deploy
sudo cp /var/lib/jenkins/workspace/package_war/target/addressbook.war .
sudo touch Dockerfile
sudo chmod 777 Dockerfile
cat<<EOT>Dockerfile
FROM tomcat
ADD addressbook.war /usr/local/tomcat/webapps/
CMD "catalina.sh" "run"
EXPOSE 8080
EOT
sudo docker build -t mcowiti/proj1:$BUILD_NUMBER .
sudo docker login -u mcowiti -p *****
sudo docker push mcowiti/proj1:BUILD_NUMBER
