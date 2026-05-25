# Define base image 
FROM nginx:latest 
# Define the creator and maintainer of the image 
MAINTAINER Baba Deen <babaloladeen@yahoo.com>
#Copy the file from the current host dir to the container
COPY index.html /usr/share/nginx/html/news.html
