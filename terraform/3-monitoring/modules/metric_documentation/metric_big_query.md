# Module Cloud Monitoring - Big Query

## Conexão com Google Cloud Composer: 

Link para documentação: https://cloud.google.com/monitoring/api/metrics_gcp#gcp-bigquery

### Métricas utilizadas: 

- BigQuery  

#### BigQuery  
 
|Métrica|API| Será utilizado? | 
|---|---|---|
|Job count|bigquery.googleapis.com/job/num_in_flight||
|BI Engine query fallback count|bigquery.googleapis.com/query/biengine_fallback_count||
|Query count|bigquery.googleapis.com/query/count||
|Query execution count|bigquery.googleapis.com/query/execution_count||
|Query execution times|bigquery.googleapis.com/query/execution_times||
|Scanned bytes|bigquery.googleapis.com/query/scanned_bytes||
|Scanned bytes billed|bigquery.googleapis.com/query/scanned_bytes_billed||
|Slots used by project, reservation, and job type|bigquery.googleapis.com/slots/allocated||
|Slots used by project|bigquery.googleapis.com/slots/allocated_for_project||
|Slots used by project and job type|bigquery.googleapis.com/slots/allocated_for_project_and_job_type||
|Slots used by project in reservation|bigquery.googleapis.com/slots/allocated_for_reservation||
|Slots used across projects in reservation|bigquery.googleapis.com/slots/total_allocated_for_reservation||
|InsertAll Inserted Bytes|bigquery.googleapis.com/storage/insertall_inserted_bytes||
|InsertAll Inserted Rows|bigquery.googleapis.com/storage/insertall_inserted_rows||
|Stored bytes|bigquery.googleapis.com/storage/stored_bytes||
|Table count|bigquery.googleapis.com/storage/table_count||
|Uploaded bytes|bigquery.googleapis.com/storage/uploaded_bytes||
|Uploaded bytes billed|bigquery.googleapis.com/storage/uploaded_bytes_billed||
|Uploaded rows|bigquery.googleapis.com/storage/uploaded_row_count ||
