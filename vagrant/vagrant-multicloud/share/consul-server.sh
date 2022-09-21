#!/bin/bash

export CONSUL_UI_BETA=true

consul agent -server \
-bootstrap-expect=1 \
-data-dir=/home/vagrant/.consul \
-bind=$(hostname -i) \
-client=$(hostname -i) \
-advertise=$(hostname -i) \
-enable-script-checks=true \
-ui
