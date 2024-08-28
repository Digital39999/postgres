FROM postgres:16-alpine

RUN apk add --no-cache musl-locales musl-locales-lang
COPY modify_hba.sh /docker-entrypoint-initdb.d/modify_hba.sh

COPY postgresql.conf /etc/postgresql/postgresql.conf
RUN chown postgres:postgres /etc/postgresql/postgresql.conf

CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]
