WITH base AS (
    SELECT
        TO_TIMESTAMP_NTZ(STARTED_AT) AS STARTED_AT_TS,
        DATE(TO_TIMESTAMP_NTZ(STARTED_AT)) AS DATE_STARTED_AT,
        HOUR(TO_TIMESTAMP_NTZ(STARTED_AT)) AS HOUR_STARTED_AT,
        CASE 
            WHEN DAYNAME(TO_TIMESTAMP_NTZ(STARTED_AT)) IN ('Sat','Sun')
                THEN 'WEEKEND'
            ELSE 'BUSINESSDAY'
        END AS DAY_TYPE
    FROM {{ source('demo', 'bike') }}
)

SELECT
    *,
    {{ getseason('STARTED_AT_TS') }} AS STATION_OF_YEAR
FROM base
