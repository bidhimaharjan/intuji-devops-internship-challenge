# Use an official PHP image with Apache
FROM php:7.4-apache

# Copy the current directory contents into the container at /var/www/html/
COPY . /var/www/html/

# Enable Apache rewrite module
RUN a2enmod rewrite

# Expose port 80
EXPOSE 80

# Run Apache in the foreground
CMD ["apache2-foreground"]

