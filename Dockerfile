FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC


RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


COPY html/ /var/www/html/


RUN date > /var/www/html/buildtime.txt


EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"] 
