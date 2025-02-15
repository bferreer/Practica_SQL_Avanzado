-- Alumna Betlem Ferrer Ejercicio 7

select 
  ivr_detail1.calls_ivr_id as id_call,
  --if (ivr_detail1.billing_account_id <> 'UNKNOWN', ivr_detail1.billing_account_id, 'UNKNOWN') as billing_account_id
  ivr_detail1.billing_account_id
from `Practica_dataset.ivr_detail` ivr_detail1
group by ivr_detail1.calls_ivr_id, ivr_detail1.billing_account_id
order by ivr_detail1.billing_account_id
;
