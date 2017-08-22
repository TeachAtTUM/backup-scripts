if (( $# != 1 ))
then
  echo "Please supply a backup directory"
  exit 1
fi

MYSQL_USER="root"

DUMP_DIR=$1
if [ ! -d $DUMP_DIR ]; then
    echo "Backup directory not found!"
    return 1;
fi

# edxapp
mysql -u "$MYSQL_USER" edxapp < $DUMP_DIR/edxapp.sql
mysql -u "$MYSQL_USER" edxapp_csmh < $DUMP_DIR/edxapp_csmh.sql

mysql -u "$MYSQL_USER" dashboard < $DUMP_DIR/dashboard.sql

mysql -u "$MYSQL_USER" reports < $DUMP_DIR/reports.sql

mysql -u "$MYSQL_USER" xqueue < $DUMP_DIR/xqueue.sql
	
# E-Commerce
mysql -u "$MYSQL_USER" ecommerce < $DUMP_DIR/ecommerce.sql

# MySQL Users
mysql -u "$MYSQL_USER" mysql < $DUMP_DIR/mysql.sql

# Analytics
mysql -u "$MYSQL_USER" analytics < $DUMP_DIR/analytics.sql
mysql -u "$MYSQL_USER" analytics-api < $DUMP_DIR/analytics-api.sql
