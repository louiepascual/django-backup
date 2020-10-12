FROM alpine

LABEL maintainer="louieepascual@gmail.com"

RUN apk add --no-cache bash && \
    apk add --no-cache tini && \
    apk add --no-cache postgresql-client && \
    mkdir /mnt/backups && \
    mkdir /mnt/media

ENV BACKUPS_PATH /mnt/backups
ENV BACKUP_TIME 0 3 * * *
ENV MEDIA_ROOT /mnt/media

COPY docker-entrypoint.sh /entrypoint.sh
COPY backup restore /bin/

ENTRYPOINT ["/sbin/tini", "-v", "--", "/entrypoint.sh"]

CMD ["crond", "-f"]
