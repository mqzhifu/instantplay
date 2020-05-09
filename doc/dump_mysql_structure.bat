d:
cd /www\instantplay\doc
D:\dev\mysql-8.0.12-winx64\bin\mysqldump.exe -d -uroot -proot instantplay >  ./structure_tmp.sql
"D:\Program Files (x86)\Git\usr\bin\sed.exe" 's/AUTO_INCREMENT=[0-9]*\s*//g' d:/www/instantplay/doc/structure_tmp.sql > d:/www/instantplay/doc/structure.sql
del structure_tmp.sql
