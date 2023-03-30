# Datei Dockerfile
FROM httpd:2.4
COPY ./index.html /usr/local/apache2/htdocs/
VOLUME /home/gsus/Website/htdocs/:/usr/local/apache2/htdocs/
VOLUME /home/gsus/Website/logs/:/usr/local/apache2/logs/
