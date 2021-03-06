#!/bin/sh

export etcd_url='http://172.18.5.10:2379'

wget https://raw.githubusercontent.com/apache/incubator-apisix/master/conf/config.yaml

sed -i -e ':a' -e 'N' -e '$!ba' -e "s/allow_admin[a-z: #\/._]*\n\( *- [0-9a-zA-Z: #\/._',]*\n*\)*//g" config.yaml

sed -i -e "s%http://[0-9.]*:2379%`echo $etcd_url`%g" config.yaml

mv config.yaml ./apisix_conf/config.yaml