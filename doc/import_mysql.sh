for file in ./init_data/*
do
echo $file
#mysql  -u'root' -p'wangbin' --default-character-set=utf8  -e"load data local infile '$file' into table yiche.yiche_core fields terminated by ',' lines terminated by '\n';"
done