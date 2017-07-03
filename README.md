# backup-scripts
TSM backup scripts for the edx platform

Requires a fully set-up TSM environment. 

Add a backup user:

    adduser --disabled-password --gecos "" backup-tivoli
    su backup-tivoli
    cd ~
    git clone https://github.com/TeachAtTUM/backup-scripts.git scripts
    
Make TSM.PWD readable: 

    sudo chown backup-tivoli: /etc/adsm/TSM.PWD
    chmod u+r /etc/adsm/TSM.PWD

Set up a ~/.my.cnf for the mysql dumps:

    su backup-tivoli
    nano ~/.my.cnf
    
    [mysqldump]
    user=backup
    password=mypass

Use in a crontab like so:

    su backup-tivoli
    crontab -e

    # Weekly Backup
    0 5 * * 1 ./scripts/export-all.sh backup && ./scripts/backup-tivoli.sh .
