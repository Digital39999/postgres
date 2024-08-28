FROM postgres:16-alpine

RUN apk add --no-cache musl-locales musl-locales-lang
RUN chown postgres:postgres /etc/postgresql/postgresql.conf

COPY modify_hba.sh /usr/local/bin/modify_hba.sh
COPY postgresql.conf /etc/postgresql/postgresql.conf

RUN chmod +x /usr/local/bin/modify_hba.sh

ENTRYPOINT ["/usr/local/bin/modify_hba.sh"]
# CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]