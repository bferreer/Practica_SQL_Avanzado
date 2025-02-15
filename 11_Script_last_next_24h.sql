-- Presento 3 opciones, la buena es la opción 3a y 3b, por el número de filas resultantes en la consulta, que es el número de llamadas
-- Pero he querido presentar también las otras opciones que he estado trabajando 

-- Alumna Betlem Ferrer Ejercicio 11 - Opción 1

with number_grouped as (
  select 
    ivr_calls1.ivr_id,
    ivr_calls1.phone_number,
    ivr_calls1.start_date,
    ivr_calls1.end_date,
    if (ivr_calls1.start_date between timestamp_sub(ivr_calls2.start_date, interval 24 hour) and ivr_calls1.start_date, 1, 0) as repeated_phone_24h,
    if (ivr_calls1.start_date between timestamp_add(ivr_calls2.start_date, interval 24 hour) and ivr_calls1.start_date, 1, 0) as cause_recall_phone_24h

from `Practica_dataset.ivr_calls` ivr_calls2
  join `Practica_dataset.ivr_calls` ivr_calls1
  on ivr_calls1.phone_number = ivr_calls2.phone_number
  
)

select 
  number_grouped.ivr_id,
  number_grouped.phone_number,
  number_grouped.start_date,
  number_grouped.repeated_phone_24h,
  number_grouped.cause_recall_phone_24h
  
from number_grouped
;


-------------------------------------------------------------------------------------------------------------------------

-- Alumna Betlem Ferrer Ejercicio 11 - Opción 2 con la ayuda de Chat GPT. Esta opción me ha funcionado más rápido que la otra.

with number_grouped as (
  select 
    ivr_detail2.calls_ivr_id,
    ivr_detail2.calls_phone_number,
    ivr_detail2.calls_start_date,
    case 
      when exists(
        select ivr_detail1.calls_ivr_id from `Practica_dataset.ivr_detail` ivr_detail1
        where ivr_detail1.calls_phone_number = ivr_detail2.calls_phone_number
          and ivr_detail1.calls_start_date between timestamp_sub(ivr_detail2.calls_start_date, interval 24 hour) and ivr_detail2.calls_start_date
      ) then '1'
      else '0'
    end as calls_last_24h,

    case 
      when exists(
        select ivr_detail1.calls_ivr_id from `Practica_dataset.ivr_detail` ivr_detail1
        where ivr_detail1.calls_phone_number = ivr_detail2.calls_phone_number
          and ivr_detail1.calls_start_date between timestamp_add(ivr_detail2.calls_start_date, interval 24 hour) and ivr_detail2.calls_start_date
      ) then '1'
      else '0'
    end as calls_next_24h,

    from `Practica_dataset.ivr_detail` ivr_detail2
  
)

select 
  number_grouped.calls_ivr_id,
  number_grouped.calls_phone_number,
  number_grouped.calls_start_date,
  number_grouped.calls_last_24h,
  number_grouped.calls_next_24h
  
  from number_grouped
 ;

-----------------------------------------------------------------------------------------------------------------------

-- Ejercicio 11 Opción 3a. He separado la consulta para repeated_phone_24h de la de recall_phone_24h por la manera como hago el on del join

with number_grouped as (
  select 
    ivr_calls2.ivr_id as call_id,
    ivr_calls2.phone_number,
    ivr_calls2.start_date,
    ivr_calls2.end_date,
    if (ivr_calls2.start_date between timestamp_sub(ivr_calls2.start_date, interval 24 hour) and ivr_calls2.start_date, 1, 0) as repeated_phone_24h,
    --if (ivr_calls2.start_date between timestamp_add(ivr_calls2.start_date, interval 24 hour) and ivr_calls2.start_date, 1, 0) as cause_recall_phone_24h

from `Practica_dataset.ivr_calls` ivr_calls2

  
)

select distinct
number_grouped.call_id,
number_grouped.phone_number,
number_grouped.repeated_phone_24h,
--number_grouped.cause_recall_phone_24h
from number_grouped
right join `Practica_dataset.ivr_calls` ivr_calls2
on number_grouped.phone_number = ivr_calls2.phone_number
and number_grouped.start_date between timestamp_sub(ivr_calls2.start_date, interval 24 hour) and number_grouped.start_date

;

-----------------------------------------------------------------------------------------------------------------

--Ejercicio 11 Opción 3b He separado la consulta para repeated_phone_24h de la de recall_phone_24h por la manera como hago el on del join

with number_grouped as (
  select 
    ivr_calls2.ivr_id as call_id,
    ivr_calls2.phone_number,
    ivr_calls2.start_date,
    ivr_calls2.end_date,
    --if (ivr_calls2.start_date between timestamp_sub(ivr_calls2.start_date, interval 24 hour) and ivr_calls2.start_date, 1, 0) as repeated_phone_24h,
    if (ivr_calls2.start_date between timestamp_add(ivr_calls2.start_date, interval 24 hour) and ivr_calls2.start_date, 1, 0) as cause_recall_phone_24h

from `Practica_dataset.ivr_calls` ivr_calls2

  
)

select distinct
number_grouped.call_id,
number_grouped.phone_number,
--number_grouped.repeated_phone_24h,
number_grouped.cause_recall_phone_24h
from number_grouped
right join `Practica_dataset.ivr_calls` ivr_calls2
on number_grouped.phone_number = ivr_calls2.phone_number
and number_grouped.start_date between timestamp_add(ivr_calls2.start_date, interval 24 hour) and number_grouped.start_date

;