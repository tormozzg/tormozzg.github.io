# Mysql tips

## Mysql dump

* Create dump: ```read -s passwd ; mysqldump -udb_user -p$passwd db_name --single-transaction |pv -bat |gzip > dump.$(date +'%d.%m.%Y').sql.gz```
* Restore dump: ```gunzip < dump.sql.gz | mysql -udb_user -p db_name```
