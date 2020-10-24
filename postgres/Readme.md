# Postgres scripts and tips

### Setup default password

```
sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'postgres';"

# if you do not have a password for the User postgres ubuntu do
sudo passwd postgres
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

