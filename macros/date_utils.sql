{% macro getseason(ts_col) %}
    case
        when month({{ ts_col }}) in (12, 1, 2) then 'WINTER'
        when month({{ ts_col }}) in (3, 4, 5) then 'SPRING'
        when month({{ ts_col }}) in (6, 7, 8) then 'SUMMER'
        else 'AUTUMN'
    end
{% endmacro %}
