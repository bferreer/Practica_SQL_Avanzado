--Alumna Betlem Ferrer Ejercicio 8

select 
  ivr_detail1.calls_ivr_id,
  if (contains_substr(ivr_detail1.calls_module_aggregation, 'AVERIA_MASIVA'), '1', '0') as masiva_lg
from `Practica_dataset.ivr_detail` ivr_detail1
;