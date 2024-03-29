#!/bin/sh
wget http://database.clamav.net/main.cvd
sudo cp main.cvd /var/lib/clamav/
sudo chown clamav:clamav /var/lib/clamav/main.cvd
sudo chmod 644 /var/lib/clamav/main.cvd
