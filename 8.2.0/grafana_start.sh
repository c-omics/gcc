#!/bin/bash


cd /usr/share/grafana
source /etc/sysconfig/grafana-server

if [[ ! -z ${PASSWORD+x} ]] ; then
  sudo sed -i "s/^;admin_password =.*$/;admin_password = ${PASSWORD}/" /etc/grafana/grafana.ini
fi
sudo /usr/sbin/grafana-server                                                       \
                            --config=${CONF_FILE}                                   \
                            --pidfile=${PID_FILE_DIR}/grafana-server.pid            \
                            cfg:default.paths.logs=${LOG_DIR}                       \
                            cfg:default.paths.data=${DATA_DIR}                      \
                            cfg:default.paths.plugins=${PLUGINS_DIR}                \
                            cfg:default.paths.provisioning=${PROVISIONING_CFG_DIR}
