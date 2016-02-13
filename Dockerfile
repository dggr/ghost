FROM ghost:0.7.6

ADD adapter.sh /opt/adapter.sh
ADD config_mysql.js /opt/config_mysql.js
ADD config_sqlite.js /opt/config_sqlite.js
RUN chmod +x /opt/adapter.sh

ENV GHOST_CONTENT /var/ghost
RUN mkdir -p "$GHOST_CONTENT" && chown -R user:user "$GHOST_CONTENT"
VOLUME $GHOST_CONTENT

ENTRYPOINT ["/opt/adapter.sh", "/entrypoint.sh"]
CMD ["npm", "start", "--production"]
