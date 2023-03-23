# Datei Dockerfile
FROM canonical/apache2
LABEL maintainer "gabriel.sustarsic@edu.gbssg.ch"
RUN	apt-get update && \
	sudo mv /var/www/html/index.html /var/www/html/index.html.bak && \
	sudo mkdir -p /var/www/html/website && \
COPY /vmadmin/Website/index.html /var/www/html/website 
COPY /vmadmin/Website/Ablaufdiagramm.png /var/www/html/website 
COPY /vmadmin/Website/Aufbaudigramm.png /var/www/html/website 
COPY /vmadmin/Website/iperka.html /var/www/html/website 
COPY /vmadmin/Website/organisation.html /var/www/html/website 
COPY /vmadmin/Website/projekte.html /var/www/html/website
COPY /vmadmin/Website/style.css /var/www/html/website 
COPY /vmadmin/Website/verzechnisse.html /var/www/html/website 
RUN	sudo chown -R $USER:$USER /var/www/html/website && \
	sudo chmod -R 755 /var/www/html/test && \
	sudo nano /etc/apache2/sites-available/website.conf
	sudo a2ensite website.conf && \
	sudo systemctl enable apache2 && \
	sudo systemctl reload apache2 && \
CMD ["/bin/bash"]
