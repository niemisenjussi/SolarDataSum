DELETE FROM 
   "POWER_USAGE_SEC" 
WHERE 
   "PERIOD_START_TIME" < current_timestamp - interval '7 day'


