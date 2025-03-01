# Module Cloud Monitoring - Cloud Composer

## Conexão com Google Cloud Composer: 

Link para documentação: https://cloud.google.com/composer/docs/composer-2/monitor-environments?hl=pt-br

### Métricas utilizadas: 

- Integridade do ambiente
- Integridade do banco de dados
- Métricas de banco de dados
- Métricas do worker
- Métricas do programador
- Métricas do acionador
- Métricas do servidor da Web
- Métricas do DAG
- Métricas do Executor do Celery
- Métricas do Airflow

#### Integridade do ambiente

Para verificar a integridade do ambiente, use a seguinte métrica de status de integridade: `composer.googleapis.com/environment/healthy`.

#### Integridade do banco de dados

Para verificar a integridade do ambiente, use a seguinte métrica de status de integridade: `composer.googleapis.com/environment/database_health`.

#### Métricas de banco de dados
|Métrica|API| Será utilizado? | 
|---|---|---|
|Uso de CPU do banco de dados|composer.googleapis.com/environment/database/cpu/usage_time||
|Núcleos da CPU do banco de dados|composer.googleapis.com/environment/database/cpu/reserved_cores||
|Uso de CPU do banco de dados|composer.googleapis.com/environment/database/cpu/utilization	|
|Uso da memória do banco de dados|composer.googleapis.com/environment/database/memory/bytes_used	|
|Cota de memória do banco de dados|composer.googleapis.com/environment/database/memory/quota	|
|Uso de memória do banco de dados|composer.googleapis.com/environment/database/memory/utilization	|
|Uso do disco do banco de dados|composer.googleapis.com/environment/database/disk/bytes_used	|
|Cota de disco do banco de dados|composer.googleapis.com/environment/database/disk/quota	|
|Uso do disco do banco de dados|composer.googleapis.com/environment/database/disk/utilization	|
|Limite de conexões de banco de dados|composer.googleapis.com/environment/database/network/max_connections	|
|Conexões de banco de dados|composer.googleapis.com/environment/database/network/connections	|
|Banco de dados disponível para failover|composer.googleapis.com/environment/database/available_for_failover	|
|Contagem automática de solicitações de failover do banco de dados|composer.googleapis.com/environment/database/auto_failover_request_count|


#### Métricas do worker

|Métrica|API| Será utilizado? | 
|---|---|---|
|Meta de fator de escala|composer.googleapis.com/environment/worker/scale_factor_target|


#### Métricas do programador

|Métrica|API| Será utilizado? | 
|---|---|---|
|Programadores ativos|composer.googleapis.com/environment/active_schedulers||


#### Métricas do acionador

|Métrica|API| Será utilizado? | 
|---|---|---|
|Acionadores ativos|composer.googleapis.com/environment/active_triggerers||
 

#### Métricas do servidor da Web

|Métrica|API| Será utilizado? | 
|---|---|---|
|Uso de CPU do servidor da Web|composer.googleapis.com/environment/web_server/cpu/usage_time||
|Cota de CPU do servidor da Web|composer.googleapis.com/environment/web_server/cpu/reserved_cores||
|Uso da memória do servidor da Web|composer.googleapis.com/environment/web_server/memory/bytes_used||
|Cota de memória do servidor da Web|composer.googleapis.com/environment/web_server/memory/quota||
|Servidores da Web ativos|composer.googleapis.com/environment/active_webservers|


#### Métricas do DAG

|Métrica|API| Será utilizado? | 
|---|---|---|
|Número de execuções de DAG|composer.googleapis.com/workflow/run_count|&check;|
|Duração de cada execução do DAG|composer.googleapis.com/workflow/run_duration|    |
|Número de execuções da tarefa	|composer.googleapis.com/workflow/task/run_count|   | 
|Duração de cada execução de tarefa	|composer.googleapis.com/workflow/task/run_duration||

#### Métricas do Executor do Celery


|Métrica|API| Será utilizado? | 
|---|---|---|
|Número de tarefas na fila|composer.googleapis.com/environment/task_queue_length|
|Número de workers on-line do Celery|composer.googleapis.com/environment/num_celery_workers|

#### Métricas do Airflow

|Métrica|API| Será utilizado? | 
|---|---|---|
|Códigos de saída de tarefa Celery diferentes de zero|composer.googleapis.com/environment/celery/execute_command_failure_count	||
|Tempo limite de publicação da tarefa Celery|composer.googleapis.com/environment/celery/task_timeout_error_count	||
|Duração serializada da busca do DAG|composer.googleapis.com/environment/collect_db_dag_duration	||
|Erros de atualização do DAG|composer.googleapis.com/environment/dag_callback/exception_count	||
|Erros de atualização do DAG|composer.googleapis.com/environment/dag_file/refresh_error_count	||
|Tempo de carregamento do arquivo DAG|composer.googleapis.com/environment/dag_processing/last_duration	||
|Tempo desde o processamento do arquivo DAG	|composer.googleapis.com/environment/dag_processing/last_run_elapsed_time	||
|Contagem de paradas do DagFileProcessorManager|composer.googleapis.com/environment/dag_processing/manager_stall_count	||
|Erros de análise do DAG|composer.googleapis.com/environment/dag_processing/parse_error_count	||
|Como executar processos de análise do DAG|composer.googleapis.com/environment/dag_processing/processes	||
|Tempos limite do processador| composer.googleapis.com/environment/dag_processing/processor_timeout_count	||
|Tempo necessário para verificar e importar todos os arquivos DAG|composer.googleapis.com/environment/dag_processing/total_parse_time||
|Tamanho atual da bagagem do DAG|composer.googleapis.com/environment/dagbag_size||
|SLA de notificações ausentes por e-mail|composer.googleapis.com/environment/email/sla_notification_failure_count	||
|Abrir slots no executor|composer.googleapis.com/environment/executor/open_slots	||
|Tarefas enfileiradas no executor|composer.googleapis.com/environment/executor/queued_tasks	||
|Como executar tarefas no executor|composer.googleapis.com/environment/executor/running_tasks	||
|Sucessos/falhas da instância da tarefa	|composer.googleapis.com/environment/finished_task_instance_count	||
|Tarefas iniciadas/concluídas|composer.googleapis.com/environment/job/count	||
|Falhas de sinal de funcionamento do job|composer.googleapis.com/environment/job/heartbeat_failure_count	||
|Tarefas criadas por operador|composer.googleapis.com/environment/operator/created_task_instance_count	||
|Execuções do operador|composer.googleapis.com/environment/operator/finished_task_instance_count	||
|Abrir slots no pool|composer.googleapis.com/environment/pool/open_slots	||
|Slots enfileirados no pool	|composer.googleapis.com/environment/pool/queued_slots	||
|Como executar slots no pool|composer.googleapis.com/environment/pool/running_slots	||
|Tarefas com fome no pool|composer.googleapis.com/environment/pool/starving_tasks	||
|Tempo gasto na seção crítica do programador|composer.googleapis.com/environment/scheduler/critical_section_duration	||
|Falhas críticas de bloqueio de seção|composer.googleapis.com/environment/scheduler/critical_section_lock_failure_count	||
|Tarefas eliminadas externamente|composer.googleapis.com/environment/scheduler/task/externally_killed_count	||
|Tarefas órfãs|composer.googleapis.com/environment/scheduler/task/orphan_count	||
|Execução/inatividade/tarefas executáveis|composer.googleapis.com/environment/scheduler/tasks	||
|Sinal de funcionamento do programador|composer.googleapis.com/environment/scheduler_heartbeat_count	||
|Notificações de callback de SLA com falha|composer.googleapis.com/environment/sla_callback_notification_failure_count	||
|Falhas de exceção do sensor inteligente|composer.googleapis.com/environment/smart_sensor/exception_failures	||
|Falhas de infraestrutura do sensor inteligente	|composer.googleapis.com/environment/smart_sensor/infra_failures	||
|Exceções inteligentes de sensor|composer.googleapis.com/environment/smart_sensor/poked_exception	||
|O sensor inteligente cutucou as tarefas|composer.googleapis.com/environment/smart_sensor/poked_success	||
|Tarefas inteligentes do sensor	|composer.googleapis.com/environment/smart_sensor/poked_tasks	||
|Instâncias de tarefas bem-sucedidas|composer.googleapis.com/environment/task_instance/previously_succeeded_count	||
|Acionadores de bloqueio|composer.googleapis.com/environment/trigger/blocking_count	||
|Acionadores com falha|composer.googleapis.com/environment/trigger/failed_count	||
|Acionadores bem-sucedidos|composer.googleapis.com/environment/trigger/succeeded_count	||
|Tarefas zumbis mortas|composer.googleapis.com/environment/zombie_task_killed_count	||
|Duração da execução do DAG	| composer.googleapis.com/workflow/dag/run_duration	||
|Duração da verificação de dependência do DAG|composer.googleapis.com/workflow/dependency_check_duration	||
|Atraso na programação da execução do DAG|composer.googleapis.com/workflow/schedule_delay	||
|Tarefas concluídas	|composer.googleapis.com/workflow/task_instance/finished_count	||
|Duração da execução da instância da tarefa	|composer.googleapis.com/workflow/task_instance/run_duration	||
|Tarefas iniciadas	|composer.googleapis.com/workflow/task_instance/started_count		||
|Tarefas removidas do DAG|composer.googleapis.com/workflow/task/removed_from_dag_count	||
|Tarefas restauradas para o DAG	|composer.googleapis.com/workflow/task/restored_to_dag_count||
|Atraso na programação de tarefas|composer.googleapis.com/workflow/task/schedule_delay	||