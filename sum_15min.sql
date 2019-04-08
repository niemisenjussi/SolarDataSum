
--15min summarization
INSERT INTO "POWER_USAGE_15MIN"

SELECT
    to_timestamp(floor((extract('epoch' from "PERIOD_START_TIME"::timestamp with time zone) / 900 )) * 900)::timestamp without time zone,
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
    "PERIOD_START_TIME" > current_timestamp - interval '30 minute'
    and to_timestamp(floor((extract('epoch' from "PERIOD_START_TIME"::timestamp with time zone) / 900 )) * 900)::timestamp without time zone =
        to_timestamp(floor((extract('epoch' from current_timestamp::timestamp with time zone -interval '15 minute') / 900 )) * 900)::timestamp without time zone
GROUP BY 
    to_timestamp(floor((extract('epoch' from "PERIOD_START_TIME"::timestamp with time zone) / 900 )) * 900)::timestamp without time zone

