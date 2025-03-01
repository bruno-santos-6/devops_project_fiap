# Module Cloud Monitoring - Dataproc

## Conexão com Google Dataproc: 

Link para documentação: https://cloud.google.com/monitoring/api/metrics_gcp#gcp-dataproc

### Métricas utilizadas: 

- Dataproc  

#### Dataproc
 
|Métrica|API| Será utilizado? | 
|---|---|---|
|HDFS DataNodes|dataproc.googleapis.com/cluster/hdfs/datanodes||
|HDFS capacity|dataproc.googleapis.com/cluster/hdfs/storage_capacity ||
|HDFS storage utilization|dataproc.googleapis.com/cluster/hdfs/storage_utilization||
|Unhealthy HDFS blocks by status|dataproc.googleapis.com/cluster/hdfs/unhealthy_blocks||
|Job duration|dataproc.googleapis.com/cluster/job/completion_time||
|Job state duration|dataproc.googleapis.com/cluster/job/duration||
|Failed jobs|dataproc.googleapis.com/cluster/job/failed_count||
|Running jobs|dataproc.googleapis.com/cluster/job/running_count||
|Submitted jobs|dataproc.googleapis.com/cluster/job/submitted_count||
|Operation duration|dataproc.googleapis.com/cluster/operation/completion_time||
|Operation state duration|dataproc.googleapis.com/cluster/operation/duration||
|Failed operations|dataproc.googleapis.com/cluster/operation/failed_count||
|Running operations|dataproc.googleapis.com/cluster/operation/running_count||
|Submitted operations|dataproc.googleapis.com/cluster/operation/submitted_count||
|YARN allocated memory percentage|dataproc.googleapis.com/cluster/yarn/allocated_memory_percentage ||
|YARN active applications|dataproc.googleapis.com/cluster/yarn/apps||
|YARN containers|dataproc.googleapis.com/cluster/yarn/containers||
|YARN memory size|dataproc.googleapis.com/cluster/yarn/memory_size||
|YARN NodeManagers|dataproc.googleapis.com/cluster/yarn/nodemanagers||
|YARN pending memory size|dataproc.googleapis.com/cluster/yarn/pending_memory_size||
|YARN virtual cores|dataproc.googleapis.com/cluster/yarn/virtual_cores||
|Job state|dataproc.googleapis.com/job/state ||
