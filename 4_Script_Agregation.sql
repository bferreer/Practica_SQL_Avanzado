-- Alumna Betlem Ferrer Ejercicio 4 Práctica
select 
  ivr_calls1.ivr_id as id_call,
  ivr_calls1.vdn_label, 
  case 
    when starts_with(ivr_calls1.vdn_label, 'ATC') then 'FRONT'
    when starts_with(ivr_calls1.vdn_label, 'TECH') then 'TECH'
    when ivr_calls1.vdn_label = 'ABSORPTION' then 'ABSORPTION'
    else 'RESTO'
    end as vdn_aggregation,
  
from `Practica_dataset.ivr_calls` ivr_calls1
;




-- Alumna Betlem Ferrer Ejercicio 4 Práctica (comprobación)
select 
  case 
    when starts_with(ivr_detail1.calls_vdn_label, 'ATC') then 'FRONT'
    when starts_with(ivr_detail1.calls_vdn_label, 'TECH') then 'TECH'
    when ivr_detail1.calls_vdn_label = 'ABSORPTION' then 'ABSORPTION'
    else 'RESTO'
    end as vdn_aggregation,
    count (*) as counter
from `Practica_dataset.ivr_detail` ivr_detail1
group by vdn_aggregation
order by vdn_aggregation ASC
;