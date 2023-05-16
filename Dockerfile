# Utilisez une image de base Node.js
FROM node:14

# Définissez le répertoire de travail dans le conteneur
WORKDIR /app

# Copiez le package.json et package-lock.json pour installer les dépendances
COPY package*.json ./

# Installez les dépendances
RUN npm install

# Copiez le code source de votre application
COPY . .

# Exposez le port sur lequel votre application écoute
EXPOSE 3000

# Démarrez votre application
CMD [ "npm", "start" ]
