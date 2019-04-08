INSERT INTO "POWER_USAGE_DAY"

select
    date_trunc('day', "PERIOD_START_TIME"),
    round((SUM("VOLTAGE")/COUNT("VOLTAGE"))::numeric,2),
    round((SUM("CURRENT")/COUNT("CURRENT"))::numeric,2),
    round((SUM("PWM_R1")/COUNT("PWM_R1"))::numeric,2),
    round((SUM("PWM_R2")/COUNT("PWM_R2"))::numeric,2),
    round((SUM("PWM_R3")/COUNT("PWM_R3"))::numeric,2),
    round((SUM("TEMP1")/COUNT("TEMP1"))::numeric,2),
    round((SUM("TEMP2")/COUNT("TEMP2"))::numeric,2),
    round((SUM("TEMP3")/COUNT("TEMP3"))::numeric,2),
    round((SUM("POWER")/COUNT("POWER"))::numeric,2)
FROM 
    "POWER_USAGE_SEC" 
WHERE 
    date_trunc('day', "PERIOD_START_TIME") = date_trunc('day',current_timestamp) - interval '1 day'
GROUP BY
    date_trunc('day', "PERIOD_START_TIME")

