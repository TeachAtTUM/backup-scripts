if (( $# != 1 ))
then
  echo "Please supply a backup directory"
  exit 1
fi

BACKUP_DIR=$(readlink -f $1)

dsmc select $BACKUP_DIR/*
