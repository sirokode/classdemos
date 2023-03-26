FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install -y nginx vim
RUN rm /var/www/html/*

RUN echo "<H1> This is example home page </H1>" > /var/www/html/index.html
CMD /usr/sbin/nginx -g "daemon off;"

EXPOSE 80
