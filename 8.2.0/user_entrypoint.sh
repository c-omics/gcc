#!/bin/bash 

if [[ ! -z ${HOST_USER_ID+x} &&  ! -z ${HOST_GROUP_ID+x} ]] ; then
   groupadd -g $HOST_GROUP_ID -f user 
   useradd -m -s /bin/bash -u $HOST_USER_ID  -g $HOST_GROUP_ID user
   sed -i '/^root/a user    ALL=(ALL)       NOPASSWD: ALL'  /etc/sudoers 
   /usr/local/bin/grafana_start.sh &
   /usr/local/sbin/gosu user "$@"
#   su -l user -c $@
   exit 0
else
 /usr/local/bin/grafana_start.sh &
 exec "$@"
fi

