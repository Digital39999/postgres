FROM postgres:16-alpine

RUN apk add --no-cache musl-locales musl-locales-lang

COPY config/pg_hba.conf /etc/postgresql/pg_hba.conf
COPY config/postgresql.conf /etc/postgresql/postgresql.conf

RUN chown postgres:postgres /etc/postgresql/postgresql.conf /etc/postgresql/pg_hba.conf

CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf", "-c", "hba_file=/etc/postgresql/pg_hba.conf"]