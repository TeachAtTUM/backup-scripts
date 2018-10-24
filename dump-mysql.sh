if (( $# != 1 ))
then
  echo "Please supply a backup directory"
  exit 1
fi

MYSQL_USER="root"

DUMP_DIR=$1
mkdir $DUMP_DIR


# mediacore
mysqldump -u "$MYSQL_USER" mediacore > $DUMP_DIR/mediacore.sql

# MySQL Users
mysqldump -u "$MYSQL_USER" --events mysql > $DUMP_DIR/mysql.sql

