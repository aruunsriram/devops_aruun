#Setting up the base image
FROM node:18 AS build

#set working directory
WORKDIR /app

#copy the package.json and install dependencies
COPY package.json ./

# install the dependencies
RUN npm install

#copy the rest of the app code
COPY . .

#build the react app
RUN npm run build

#serve the app with nginx
FROM nginx:alpine

#copy the build folder to the nginx html folder
COPY --from=build /app/build /usr/share/nginx/html

# expose the port
EXPOSE 80




