BACKUP_DIR=$(readlink -f $1)

dsmc select $BACKUP_DIR/*
