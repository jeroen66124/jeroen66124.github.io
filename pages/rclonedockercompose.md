---
title: Rclone Docker Compose
layout: default
last_modified_date: 04-10-2026
---

Create automated backups of your Docker Compose files and persistent data using Rclone. All Docker Compose files and its persistent volumes are stored within the same _/home/user/compose/_ directory. With all volume entries in compose files ```./``` is used consistently:
```
.
├── compose
│   ├── nginx
│   │   ├── data
│   │   ├── docker-compose.yml
│   ├── spotify
│   │   ├── docker-compose.yml
│   │   └── your_spotify_db
│   ├── stremio
│   │   ├── docker-compose.yaml
│   │   └── stremio-data
│   ├── tailscale
│   │   ├── docker-compose.yml
│   │   └── tailscale
│   ├── wallos
│   │   ├── db
│   │   ├── docker-compose.yml
│   └── yamtrack
│       ├── db
│       └── docker-compose.yml
└── rclone-cron.sh
``` 
This makes it possible to back up the complete Docker environment by simply copying this one directory.
In this example [Rclone](https://rclone.org/#providers) is configured with OneDrive, but any other provider supported by Rclone can be used.

### **Script**

The following script is executed automatically through cron (named _rclone-cron.sh_ as shown in file tree above):

```bash
#!/bin/bash
docker system prune --all --volumes --force
sleep 10
docker stop $(docker ps -a -q)
rclone delete onedrive:backup.zip
mkdir /home/user/backup
cp -rv /home/user/compose/ /home/user/backup/
zip -r /home/user/backup.zip /home/user/backup
rclone copy /home/user/backup.zip onedrive: --progress
sleep 10
rm -rf /home/user/backup
rm /home/user/backup.zip
docker restart $(docker ps -a -q)
```
The script first cleans up unused Docker resources (optional: prune line can be removed) and stops all containers. It then copies the entire _/home/user/compose/_ directory to a temporary backup directory and compresses it into a ZIP file. The existing backup on OneDrive is removed before uploading the new one. After the upload has completed, the temporary files are removed and all Docker containers are started again. The `onedrive:` remote can be adjusted accordingly with any Rclone remote that has been configured on the system.

### **Cron**

The backup should be configured under the `root` user to avoid permission issues with Docker and the files being backed up. Open the root user's crontab:
```bash
sudo su
sudo crontab -e
```
For example, to run the backup every day at 03:00:<br>
`0 3 * * * /home/user/rclone-cron.sh >> /home/user/rclone-cron.log 2>&1`<br>
This provides a fully automated backup of the Docker Compose files and persistent data without requiring any manual interaction.
