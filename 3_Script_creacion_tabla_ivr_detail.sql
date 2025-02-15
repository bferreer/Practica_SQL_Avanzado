-- Alumna: Betlem Ferrer Ejercicio 3 de la práctica
create or replace table `Practica_dataset.ivr_detail` as 
select 
  ivr_calls1.ivr_id as calls_ivr_id,
  ivr_calls1.phone_number as calls_phone_number,
  ivr_calls1.ivr_result as calls_ivr_result, 
  ivr_calls1.vdn_label as calls_vdn_label,
  ivr_calls1.start_date as calls_start_date,
  format_date('%Y-%m-%d', ivr_calls1.start_date) as calls_start_date_id,
  ivr_calls1.end_date as calls_end_date,
  format_date('%Y-%m-%d', ivr_calls1.end_date) as calls_start_end_id,
  ivr_calls1.total_duration as calls_total_duration,
  ivr_calls1.customer_segment as calls_customer_segment,
  ivr_calls1.ivr_language as calls_ivr_languaje,
  ivr_calls1.steps_module as calls_steps_module,
  ivr_calls1.module_aggregation as calls_module_aggregation,
  ivr_modules1.module_sequece as module_sequence,
  ivr_modules1.module_name as module_name,
  ivr_modules1.module_duration as module_duration,
  ivr_modules1.module_result as module_result,
  ivr_steps1.module_sequece as step_sequence,
  ivr_steps1.step_name as step_name,
  ivr_steps1.step_result as step_result,
  ivr_steps1.step_description_error as step_description_error,
  ivr_steps1.document_type as document_type,
  ivr_steps1.document_identification as document_identification,
  ivr_steps1.customer_phone as customer_phone,
  ivr_steps1.billing_account_id as billing_account_id

from `Practica_dataset.ivr_calls` ivr_calls1
inner join `Practica_dataset.ivr_modules` ivr_modules1
on ivr_calls1.ivr_id = ivr_modules1.ivr_id
inner join `Practica_dataset.ivr_steps` ivr_steps1
on ivr_calls1.ivr_id = ivr_steps1.ivr_id
;

