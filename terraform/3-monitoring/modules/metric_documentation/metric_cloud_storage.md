# Module Cloud Monitoring - Cloud Storage

## Conexão com Google Cloud Storage: 

Link para documentação: https://cloud.google.com/monitoring/api/metrics_gcp#gcp-storage

### Métricas utilizadas: 

- Cloud Storage  

#### Cloud Storage  
 
|Métrica|API| Será utilizado? | 
|---|---|---|
|Request count|storage.googleapis.com/api/request_count| &check; |
|Object-ACL based access count|storage.googleapis.com/authz/acl_based_object_access_count||
|ACLs usage|storage.googleapis.com/authz/acl_operations_count||
|Object ACL changes|storage.googleapis.com/authz/object_specific_acl_mutation_count||
|Autoclass transition count|storage.googleapis.com/autoclass/transition_operation_count||
|Autoclass transitioned bytes count|storage.googleapis.com/autoclass/transitioned_bytes_count||
|Received bytes|storage.googleapis.com/network/received_bytes_count |&check;|
|Sent bytes|storage.googleapis.com/network/sent_bytes_count|&check;|
|Object count|storage.googleapis.com/storage/object_count||
|Total byte seconds|storage.googleapis.com/storage/total_byte_seconds||
|Total bytes|storage.googleapis.com/storage/total_bytes||