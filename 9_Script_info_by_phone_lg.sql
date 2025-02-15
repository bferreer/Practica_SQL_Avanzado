--Alumna: Betlem Ferrer Ejercicio 9

select
  ivr_detail1.calls_ivr_id,
  if(ivr_detail1.step_name = 'CUSTOMERINFOBYPHONE.TX' and ivr_detail1.step_result = 'OK', '1', '0' ) as info_by_phone_lg
from `Practica_dataset.ivr_detail` ivr_detail1
order by info_by_phone_lg DESC
;