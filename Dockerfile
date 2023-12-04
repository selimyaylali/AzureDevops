# Nginx resmi imajını kullanarak başlayın
FROM nginx:alpine

# Statik içeriği Nginx sunucusuna kopyalayın
COPY . /usr/share/nginx/html

RUN chmod -R 755 /usr/share/nginx/html

# Nginx varsayılan olarak port 80 üzerinde çalışır
EXPOSE 80
EXPOSE 8080
