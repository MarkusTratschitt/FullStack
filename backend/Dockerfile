# Verwende das offizielle Node.js-Image
FROM node:18

# Setze das Arbeitsverzeichnis
WORKDIR /usr/src/app

# Kopiere package.json und package-lock.json
COPY package*.json ./

# Installiere die Abhängigkeiten
RUN npm install

# Kopiere den Rest des Quellcodes
COPY . .

# Exponiere den Port, auf dem die Anwendung läuft
EXPOSE 8000

# Starte die Anwendung
CMD npm start 
