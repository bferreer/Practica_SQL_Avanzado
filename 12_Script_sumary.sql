-- Alumna: Betlem Ferrer Ejercicio 12 de la práctica


create or replace table `Practica_dataset.ivr_sumary` as 

with number_grouped as (
  select 
    ivr_calls2.ivr_id as call_id,
    ivr_calls2.phone_number,
    ivr_calls2.start_date,
    ivr_calls2.end_date,
    if (ivr_calls1.start_date between timestamp_sub(ivr_calls2.start_date, interval 24 hour) and ivr_calls1.start_date, 1, 0) as repeated_phone_24h,
    if (ivr_calls1.start_date between timestamp_add(ivr_calls2.start_date, interval 24 hour) and ivr_calls1.start_date, 1, 0) as cause_recall_phone_24h

from `Practica_dataset.ivr_calls` ivr_calls2
  join `Practica_dataset.ivr_calls` ivr_calls1
  on ivr_calls1.phone_number = ivr_calls2.phone_number

)


select
  ivr_detail2.calls_ivr_id as ivr_id,
  ivr_detail2.calls_phone_number as phone_number,
  ivr_detail2.calls_ivr_result as calls_ivr_result, 
  case 
    when starts_with(ivr_detail2.calls_vdn_label, 'ATC') then 'FRONT'
    when starts_with(ivr_detail2.calls_vdn_label, 'TECH') then 'TECH'
    when ivr_detail2.calls_vdn_label = 'ABSORPTION' then 'ABSORPTION'
    else 'RESTO'
    end as vdn_aggregation,
  
  ivr_detail2.calls_start_date as start_date,
  ivr_detail2.calls_end_date as end_date,
  ivr_detail2.calls_total_duration as total_duration,
  ivr_detail2.calls_customer_segment as customer_segment,
  ivr_detail2.calls_ivr_languaje as ivr_languaje,
  ivr_detail2.calls_steps_module as steps_module,
  ivr_detail2.calls_module_aggregation as module_aggregation,
  if (ivr_detail2.document_type <> 'UNKNOWN', ivr_detail2.document_type, 'NO IDENTIFICADO' ) as document_type,
  if (ivr_detail2.document_identification <> 'UNKNOWN', ivr_detail2.document_identification, 'NO IDENTIFICADO' ) as document_identification,
  ivr_detail2.calls_phone_number as customer_phone,
  ivr_detail2.billing_account_id as billing_account_id,
  if (contains_substr(ivr_detail2.calls_module_aggregation, 'AVERIA_MASIVA'), '1', '0') as masiva_lg,
  if (ivr_detail2.step_name = 'CUSTOMERINFOBYPHONE.TX' and ivr_detail2.step_result = 'OK', '1', '0' ) as info_by_phone_lg,
  if (ivr_detail2.step_name = 'CUSTOMERINFOBYDNI.TX' and ivr_detail2.step_result = 'OK', '1', '0' ) as info_by_dni_lg,
  if (number_grouped.start_date between timestamp_sub(ivr_calls2.start_date, interval 24 hour) and number_grouped.start_date, 1, 0) as repeated_phone_24h,
  if (number_grouped.start_date between timestamp_add(ivr_calls2.start_date, interval 24 hour) and number_grouped.start_date, 1, 0) as cause_recall_phone_24h
    
from number_grouped
right join `Practica_dataset.ivr_calls` ivr_calls2
on number_grouped.phone_number = ivr_calls2.phone_number
and number_grouped.start_date between timestamp_sub(ivr_calls2.start_date, interval 24 hour) and number_grouped.start_date
and number_grouped.start_date between timestamp_add(ivr_calls2.start_date, interval 24 hour) and number_grouped.start_date
left join `Practica_dataset.ivr_detail` ivr_detail2
on number_grouped.call_id = ivr_detail2.calls_ivr_id

;
