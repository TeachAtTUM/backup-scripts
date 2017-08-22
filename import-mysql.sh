if (( $# != 1 ))
then
  print "Please supply a backup directory"
  exit 1
fi

MYSQL_USER="root"

DUMP_DIR=$1
if [ ! -d $DUMP_DIR ]; then
    print "Backup directory not found!"
    return 1;
fi

# edxapp
echo "CREATE SCHEMA edxapp" | mysql -u "$MYSQL_USER" 
mysql -u "$MYSQL_USER" edxapp < $DUMP_DIR/edxapp.sql
echo "CREATE SCHEMA edxapp_csmh" | mysql -u "$MYSQL_USER" 
mysql -u "$MYSQL_USER" edxapp_csmh < $DUMP_DIR/edxapp_csmh.sql

echo "CREATE SCHEMA dashboard" | mysql -u "$MYSQL_USER" 
mysql -u "$MYSQL_USER" dashboard < $DUMP_DIR/dashboard.sql

echo "CREATE SCHEMA reports" | mysql -u "$MYSQL_USER" 
mysql -u "$MYSQL_USER" reports < $DUMP_DIR/reports.sql

echo "CREATE SCHEMA xqueue" | mysql -u "$MYSQL_USER" 
mysql -u "$MYSQL_USER" xqueue < $DUMP_DIR/xqueue.sql
	
# E-Commerce
echo "CREATE SCHEMA ecommerce" | mysql -u "$MYSQL_USER" 
mysql -u "$MYSQL_USER" ecommerce < $DUMP_DIR/ecommerce.sql

# MySQL Users
mysql -u "$MYSQL_USER" mysql < $DUMP_DIR/mysql.sql

# Analytics
echo "CREATE SCHEMA analytics" | mysql -u "$MYSQL_USER" 
mysql -u "$MYSQL_USER" analytics < $DUMP_DIR/analytics.sql
echo "CREATE SCHEMA analytics-api" | mysql -u "$MYSQL_USER" 
mysql -u "$MYSQL_USER" analytics-api < $DUMP_DIR/analytics-api.sql
