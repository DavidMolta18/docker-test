# Imagen base de Node
FROM node:14

# Directorio de trabajo en /app
WORKDIR /app

# Copiar los archivos package.json y package-lock.json
COPY package*.json ./

# Dependencias
RUN npm install

# Copiar todo el código de la app
COPY . .

# Construir la aplicación
RUN npm run build

# Puerto donde la aplicación estará disponible
EXPOSE 3000

# Permite correr la aplicación en modo de producción
CMD ["npx", "serve", "-s", "build", "-l", "3000"]