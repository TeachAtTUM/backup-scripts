DUMP_DIR=$1
mkdir $DUMP_DIR

source /edx/app/edxapp/edxapp_env && \
     python /edx/app/edxapp/edx-platform/manage.py \
     cms --settings=aws export_all_courses $DUMP_DIR
