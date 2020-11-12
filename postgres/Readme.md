# Postgres scripts and tips

### Setup default password

```
sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'postgres';"

# if you do not have a password for the User postgres ubuntu do
sudo passwd postgres
```

### Configure host server access

Add or edit the following line in your postgresql.conf :

```
listen_addresses = '*'
```

Add the following line as the first line of pg_hba.conf. It allows access to all databases for all users with an encrypted password:

```
host  all  all 0.0.0.0/0 md5
```

Restart Postgresql after adding this with service postgresql restart or the equivalent command for your setup.

### Install pgmetrics tool

```
# download tool from repo
https://pgmetrics.io/

# use tool as psql
```

### Delete all tables in current database

```
DO $$ DECLARE
    r RECORD;
BEGIN
    FOR r IN (SELECT tablename FROM pg_tables WHERE schemaname = current_schema()) LOOP
        EXECUTE 'DROP TABLE IF EXISTS ' || quote_ident(r.tablename) || ' CASCADE';
    END LOOP;
END $$;
```

