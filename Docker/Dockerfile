# Use the official PHP image
FROM php:7.4-fpm

# Copy the PHP script to the container
COPY index.php /var/www/html/

#update the image so as to limit vulnerabilities
RUN apt-get update

# Set the working directory
WORKDIR /var/www/html

# Expose port 9000 and start PHP-FPM
EXPOSE 9000
CMD ["php-fpm"]
