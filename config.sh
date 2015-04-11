#!/bin/bash

# set media to point at /media docker volume
sed -i 's/media_dir=\/var\/lib\/minidlna/media_dir=\/media/g' /etc/minidlna.conf

# set logs to point at /config docker volume
sed -i 's/#log_dir=\/var\/log/log_dir=\/config/g' /etc/minidlna.conf

# set db to point at /config docker volume
sed -i 's/#db_dir=\/var\/lib\/minidlna/db_dir=\/config/g' /etc/minidlna.conf

# set automatic discovery of new files in the media_dir directory
sed -i 's/#inotify=yes/inotify=yes/g' /etc/minidlna.conf

# set friendly name to MiniDLNA
sed -i 's/#friendly_name=/friendly_name=UnRAID-DLNA/g' /etc/minidlna.conf
