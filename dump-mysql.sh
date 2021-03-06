if (( $# != 1 ))
then
  echo "Please supply a backup directory"
  exit 1
fi

MYSQL_USER="backup"

DUMP_DIR=$1
mkdir $DUMP_DIR

# edxapp
mysqldump -u "$MYSQL_USER" edxapp > $DUMP_DIR/edxapp.sql
mysqldump -u "$MYSQL_USER" edxapp_csmh > $DUMP_DIR/edxapp_csmh.sql

mysqldump -u "$MYSQL_USER" dashboard > $DUMP_DIR/dashboard.sql

mysqldump -u "$MYSQL_USER" reports > $DUMP_DIR/reports.sql

mysqldump -u "$MYSQL_USER" xqueue > $DUMP_DIR/xqueue.sql
	
# E-Commerce
mysqldump -u "$MYSQL_USER" ecommerce > $DUMP_DIR/ecommerce.sql

# MySQL Users
mysqldump -u "$MYSQL_USER" mysql > $DUMP_DIR/mysql.sql

# Analytics
mysqldump -u "$MYSQL_USER" analytics > $DUMP_DIR/analytics.sql
mysqldump -u "$MYSQL_USER" analytics-api > $DUMP_DIR/analytics-api.sql


# Mongo
#mongodump -o $DUMP_DIR/mongo
# Contains MONGO_PASSWORD=my_password
. ~/.appsecrets
echo $MONGO_PASSWORD | mongodump -o $DUMP_DIR/mongo --authenticationDatabase admin -u admin -p
