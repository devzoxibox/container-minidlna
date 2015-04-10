#!/bin/bash

chown -R nobody:users /etc/minidlna.conf

# set media to point at /media docker volume
sed -i 's/media_dir=\/var\/lib\/minidlna/media_dir=\/media/g' /etc/minidlna.conf

# set logs to point at /config docker volume
sed -i 's/#log_dir=\/var\/log/log_dir=\/config/g' /etc/minidlna.conf

# set db to point at /config docker volume
sed -i 's/#db_dir=\/var\/lib\/minidlna/db_dir=\/config/g' /etc/minidlna.conf

# set process to run as user nobody
#sed -i 's/user=minidlna/user=nobody/g' /etc/minidlna.conf

# set friendly name to MiniDLNA
sed -i 's/#friendly_name=/friendly_name=MiniDLNA/g' /etc/minidlna.conf

# if minidlna config file doesnt exist then copy default to host config volume
if [ ! -f "/config/minidlna.conf" ]; then

	# copy over customised config
	cp /etc/minidlna.conf /config/
				
fi

# set permissions for user nobody
chmod -R 775 /config/
chown -R nobody:users /config/

/etc/init.d/minidlna force-reload
