#!/bin/bash
set -e

PG_HBA_FILE="/var/lib/postgresql/data/pg_hba.conf"

until [ -f "$PG_HBA_FILE" ]; do
  sleep 1
done

sed -i "s/^local   all             all                                      .*/local   all             all                                      md5/" "$PG_HBA_FILE"
sed -i "s/^host    all             all             127.0.0.1\/32            .*/host    all             all             127.0.0.1\/32            md5/" "$PG_HBA_FILE"
sed -i "s/^host    all             all             ::1\/128                 .*/host    all             all             ::1\/128                 md5/" "$PG_HBA_FILE"
sed -i "s/^host    all             all             0.0.0.0\/0               .*/host    all             all             0.0.0.0\/0               md5/" "$PG_HBA_FILE"

sed -i "/trust/d" "$PG_HBA_FILE"

echo "pg_hba.conf has been modified."
exec postgres -c "config_file=/etc/postgresql/postgresql.conf"