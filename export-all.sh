BACKUP_DIR=$(readlink -f $1)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir $BACKUP_DIR
rm -rf $BACKUP_DIR/*

$SCRIPT_DIR/export-courses.sh $BACKUP_DIR/courses
$SCRIPT_DIR/dump-mysql.sh $BACKUP_DIR/mysql-dumps
