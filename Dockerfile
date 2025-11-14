FROM ghost:5-alpine

# Start script kopieren
COPY start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /var/lib/ghost

CMD ["/start.sh"]