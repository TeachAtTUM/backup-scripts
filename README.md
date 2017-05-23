# backup-scripts
TSM backup scripts for the edx platform

Use in a crontab like so:

    crontab -e

    # Weekly Backup
    0 5 * * 1 cd ~ && ./scripts/export-all.sh backup && ./scripts/backup-tivoli.sh .

Don't forget to setup a ~/.my.cnf for the mysql dumps:

    nano ~/.my.cnf
    
    [mysqldump]
    user=backup
    password=mypass
