#!/bin/bash

if [ ! -d /opt/apacheds/instances/container/conf ]; then
  cp -var /opt/apacheds/instances/default /opt/apacheds/instances/container
fi

exec $*
