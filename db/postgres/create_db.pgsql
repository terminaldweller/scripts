SELECT 'CREATE DATABASE irc'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'irc')\gexec
