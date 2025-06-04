# Gebruik Ubuntu 20.04 als basis image
FROM ubuntu:20.04

# Voorkom interactieve prompts tijdens pakket installatie
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

# Update pakketlijst en installeer Apache
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Kopieer de website bestanden naar Apache's web root
COPY html/ /var/www/html/

# Maak buildtime.txt aan met de huidige datum
RUN date > /var/www/html/buildtime.txt

# Stel poort 80 open
EXPOSE 80

# Start Apache in voorgrond
CMD ["apache2ctl", "-D", "FOREGROUND"] 