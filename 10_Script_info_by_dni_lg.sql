--Alumna: Betlem Ferrer Ejercicio 10

select
  ivr_detail1.calls_ivr_id,
  if(ivr_detail1.step_name = 'CUSTOMERINFOBYDNI.TX' and ivr_detail1.step_result = 'OK', '1', '0' ) as info_by_dni_lg
from `Practica_dataset.ivr_detail` ivr_detail1
;