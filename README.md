# Django Backup
A forked version of the [wordpress-backup](https://github.com/angelo-v/wordpress-backup), this is a simple utility Docker image that you can use to backup the database and media files from your django application. For now, it only supports Postgres and local media files.

## Quick Start
Make sure to define the required environment variables
```txt
DB_HOST=host
DB_NAME=name
DB_USER=user
DB_PASS=pass
```
And an optional regular cleanup
```
CLEANUP_OLDER_THAN=7
```

## Notes
* This will only backup your database's schema and data. When you use the restore function, you need to already have created the needed roles and database.
* Restoring means it will override existing files. So be careful when using this.
