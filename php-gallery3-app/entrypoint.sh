#!/bin/bash

chmod 0777 /var/www/var
apache2ctl -D FOREGROUND
