FROM nextcloud:12.0.4-apache

COPY docker-entrypoint.sh /entrypoint.sh
COPY remoteip.conf /etc/apache2/conf-available/remoteip.conf

RUN a2enmod remoteip \
 && a2enconf remoteip \
 && a2enmod ssl \
 && a2ensite default-ssl

EXPOSE 443

ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
