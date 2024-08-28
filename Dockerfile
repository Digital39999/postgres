FROM postgres:16-alpine

RUN apk add --no-cache musl-locales musl-locales-lang

COPY pg_hba.conf /var/lib/postgresql/data/pg_hba.conf
COPY postgresql.conf /var/lib/postgresql/data/postgresql.conf

RUN chown postgres:postgres /var/lib/postgresql/data/pg_hba.conf /var/lib/postgresql/data/postgresql.conf

CMD ["postgres", "-c", "config_file=/var/lib/postgresql/data/postgresql.conf"]