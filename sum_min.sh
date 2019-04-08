#!/bin/bash
cd /home/pi/datasum/
/usr/bin/psql "dbname='solar' user='solarmaster' password='solarmaster' host='127.0.0.1'" -f sum_min.sql
