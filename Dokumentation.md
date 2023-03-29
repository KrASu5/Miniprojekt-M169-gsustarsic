# Dokumentation: Webserver mit Docker in Betrieb nehmen

## Dokumentation von Gabriel Sustarsic

### Dockerfile
Im Nachfolgenden Abschnitt werde ich Kurz auf mein Dockerfile eingehen:

    # Datei Dockerfile
    FROM httpd:2.4
    COPY ./index.html /usr/local/apache2/htdocs/
    VOLUME /home/gsus/Website/htdocs/:/usr/local/apache2/htdocs/
    VOLUME /home/gsus/Website/logs/:/usr/local/apache2/logs/
    

Wie man sieht, passiert im Dockerfile selbst nicht viel. Es bezieht sich auf dem httpd Image. Hierbei handelt es sich um eine vorbereitete Version von Apache2. 
Das bedeutet der Webserver ist in diesem Image schon fertig eingerichtet. 
Anschliessend wird ein COPY Befehl ausgeführt. Mit diesem werden meine auf der VM abgespeicherten HTML Dateien in das entsprechende Apache2 Verzeichnis kopiert, damit die Website im Browser angezeigt wird.
Ausserdem werden gleich die Volumes definiert, damit die Daten lokal abgespeichert werden.

### Inbetriebnahme

Aus dem Dockerfile wird zunächst einmal ein Image erstellt:

    docker build -t my-apache2 .

Nun wird eine Instanz des Images erstellt:

    docker run -d --name apache-webserver -p 8080:80 -v /home/gsus/Website/htdocs:/usr/local/apache2/htdocs/ -v /home/gsus/Website/logs:/usr/local/apache2/logs/ my-apache2

Wie man sieht wird in diesem Befehl die Portweiterleitung (8080:80) erstellt.
Zusätzlich werden einige Dateien lokal angelegt. In diesen wird der Webserver abgespeichert und mit dem Container verlinkt. Das Volume wird eigentlich bereits mit dem Dockerfile erstellt. Die Website kann aber aus mir unbekannten Gründen nicht ausgeführt werden, wenn hier nicht noch einmal Zusätzlich die Volume-Variablen mitgibt.
