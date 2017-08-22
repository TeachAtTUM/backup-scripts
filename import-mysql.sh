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
print "CREATE SCHEMA edxapp" | mysql -u "$MYSQL_USER" 
mysql -u "$MYSQL_USER" edxapp < $DUMP_DIR/edxapp.sql
print "CREATE SCHEMA edxapp_csmh" | mysql -u "$MYSQL_USER" 
mysql -u "$MYSQL_USER" edxapp_csmh < $DUMP_DIR/edxapp_csmh.sql

print "CREATE SCHEMA dashboard" | mysql -u "$MYSQL_USER" 
mysql -u "$MYSQL_USER" dashboard < $DUMP_DIR/dashboard.sql

print "CREATE SCHEMA reports" | mysql -u "$MYSQL_USER" 
mysql -u "$MYSQL_USER" reports < $DUMP_DIR/reports.sql

print "CREATE SCHEMA xqueue" | mysql -u "$MYSQL_USER" 
mysql -u "$MYSQL_USER" xqueue < $DUMP_DIR/xqueue.sql
	
# E-Commerce
print "CREATE SCHEMA ecommerce" | mysql -u "$MYSQL_USER" 
mysql -u "$MYSQL_USER" ecommerce < $DUMP_DIR/ecommerce.sql

# MySQL Users
mysql -u "$MYSQL_USER" mysql < $DUMP_DIR/mysql.sql

# Analytics
print "CREATE SCHEMA analytics" | mysql -u "$MYSQL_USER" 
mysql -u "$MYSQL_USER" analytics < $DUMP_DIR/analytics.sql
print "CREATE SCHEMA analytics-api" | mysql -u "$MYSQL_USER" 
mysql -u "$MYSQL_USER" analytics-api < $DUMP_DIR/analytics-api.sql
