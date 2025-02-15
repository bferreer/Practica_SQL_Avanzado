-- Alumna: Betlem Ferrer Ejercicio 13

select 
  IFNULL (ivr_detail1.calls_ivr_id, -999999) as calls_clean
from `Practica_dataset.ivr_detail` ivr_detail1
;