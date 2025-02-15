-- Alumna Betlem Ferrer Ejercicio 5 Práctica

select
  ivr_detail1.calls_ivr_id as call_id,
  if (ivr_detail1.document_type <> 'UNKNOWN', ivr_detail1.document_type, 'NO IDENTIFICADO' ) as document_type,
  ivr_detail1.document_identification
from `Practica_dataset.ivr_detail` ivr_detail1

where document_type <> 'UNKNOWN'

;
  